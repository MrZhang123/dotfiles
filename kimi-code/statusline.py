#!/usr/bin/env python3
"""kimi-code custom status line.

Reads the JSON snapshot kimi-code passes on stdin (model, cwd, gitBranch,
contextTokens, maxContextTokens, version, ...) and prints ONE line:

    🚀 MODEL | branch | repo/dir | ctx 12% | ⚡ 4% 5h · 25% wk

Plan quota (weekly / 5-hour windows) comes from the managed endpoint
https://api.kimi.com/coding/v1/usages using the OAuth access token stored in
~/.kimi-code/credentials/kimi-code.json. The quota fetch is done in a
detached background refresh (cached to QUOTA_CACHE), so this script always
returns well within the 300ms budget the TUI allows.
"""

import json
import os
import subprocess
import sys
import time

KIMI_HOME = os.environ.get("KIMI_CODE_HOME") or os.path.expanduser("~/.kimi-code")
CREDENTIALS = os.path.join(KIMI_HOME, "credentials", "kimi-code.json")
QUOTA_CACHE = os.path.join(KIMI_HOME, ".statusline-quota-cache.json")
QUOTA_LOCK = os.path.join(KIMI_HOME, ".statusline-quota-refresh.lock")
USAGE_URL = os.environ.get("KIMI_CODE_BASE_URL", "https://api.kimi.com/coding/v1").rstrip("/") + "/usages"

QUOTA_TTL_S = 120  # seconds a cached quota snapshot is considered fresh
LOCK_TTL_S = 30    # seconds a refresh lock stays valid (guards concurrent refreshes)

# ANSI colors
C_RESET = "\033[0m"
C_GREEN = "\033[32m"
C_YELLOW = "\033[33m"
C_RED = "\033[31m"
C_CYAN = "\033[36m"
C_MAGENTA = "\033[35m"


def color_for(pct, text):
    if pct is None:
        return text
    color = C_GREEN if pct < 50 else C_YELLOW if pct < 80 else C_RED
    return f"{color}{text}{C_RESET}"


def pct(used, limit):
    try:
        used, limit = int(used), int(limit)
    except (TypeError, ValueError):
        return None
    if limit <= 0:
        return None
    return round(used * 100 / limit)


# ── quota fetch (runs detached via --refresh) ─────────────────────────

def refresh_quota():
    """Fetch /usages and write the cache. Invoked as a detached child."""
    # Lock: skip if another refresh started recently
    now = time.time()
    try:
        if now - os.path.getmtime(QUOTA_LOCK) < LOCK_TTL_S:
            return
    except OSError:
        pass
    try:
        with open(QUOTA_LOCK, "w") as f:
            f.write(str(os.getpid()))
    except OSError:
        return

    try:
        with open(CREDENTIALS) as f:
            token = json.load(f).get("access_token")
    except Exception:
        token = None
    if not token:
        return

    try:
        import urllib.request

        req = urllib.request.Request(
            USAGE_URL,
            headers={"Authorization": f"Bearer {token}", "Accept": "application/json"},
        )
        with urllib.request.urlopen(req, timeout=8) as resp:
            payload = json.loads(resp.read().decode())
    except Exception:
        return

    out = {"fetched_at": now, "wk": None, "h5": None}

    summary = payload.get("usage") or {}
    out["wk"] = pct(summary.get("used"), summary.get("limit"))

    for item in payload.get("limits") or []:
        window = item.get("window") or {}
        detail = item.get("detail") or {}
        unit = window.get("timeUnit")
        duration = window.get("duration") or 0
        # The 5-hour window arrives as 300 TIME_UNIT_MINUTE
        hours = duration / 60 if unit == "TIME_UNIT_MINUTE" else duration if unit == "TIME_UNIT_HOUR" else None
        if hours == 5:
            out["h5"] = pct(detail.get("used"), detail.get("limit"))
            break

    try:
        with open(QUOTA_CACHE, "w") as f:
            json.dump(out, f)
    except OSError:
        pass


def read_quota():
    """Return (wk_pct, h5_pct) from cache; kick a background refresh if stale."""
    try:
        with open(QUOTA_CACHE) as f:
            cache = json.load(f)
        age = time.time() - cache.get("fetched_at", 0)
        wk, h5 = cache.get("wk"), cache.get("h5")
    except Exception:
        age, wk, h5 = float("inf"), None, None

    if age > QUOTA_TTL_S:
        # Detached refresh; never blocks this render
        try:
            subprocess.Popen(
                [sys.executable, os.path.abspath(__file__), "--refresh"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                start_new_session=True,
            )
        except Exception:
            pass
    return wk, h5


# ── main render ───────────────────────────────────────────────────────

def main():
    try:
        snapshot = json.load(sys.stdin)
    except Exception:
        snapshot = {}

    parts = []

    model = snapshot.get("model")
    if model:
        parts.append(f"🚀 {C_CYAN}{model}{C_RESET}")

    branch = snapshot.get("gitBranch")
    if branch:
        parts.append(f"{C_MAGENTA}{branch}{C_RESET}")

    cwd = snapshot.get("cwd") or ""
    if cwd:
        segs = [s for s in cwd.rstrip("/").split("/") if s]
        short = "/".join(segs[-2:]) if segs else cwd
        parts.append(short)

    # context usage: prefer token counts; fall back to contextUsage ratio
    ctx_pct = None
    tokens, max_tokens = snapshot.get("contextTokens"), snapshot.get("maxContextTokens")
    if isinstance(tokens, (int, float)) and isinstance(max_tokens, (int, float)) and max_tokens:
        ctx_pct = round(tokens * 100 / max_tokens)
    else:
        usage = snapshot.get("contextUsage")
        if isinstance(usage, (int, float)):
            ctx_pct = round(usage * 100) if usage <= 1 else round(usage)
    if ctx_pct is not None:
        parts.append(f"ctx {color_for(ctx_pct, str(ctx_pct) + '%')}")

    wk, h5 = read_quota()
    if wk is not None or h5 is not None:
        quota_bits = []
        if h5 is not None:
            quota_bits.append(color_for(h5, f"{h5}%") + " 5h")
        if wk is not None:
            quota_bits.append(color_for(wk, f"{wk}%") + " wk")
        parts.append(f"⚡ {' · '.join(quota_bits)}")

    print(" | ".join(parts))


if __name__ == "__main__":
    if "--refresh" in sys.argv:
        refresh_quota()
    else:
        main()
