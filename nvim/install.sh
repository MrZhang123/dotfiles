#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/nvim"
lazy_dir="$data_dir/lazy/lazy.nvim"

# Set INSTALL_LANGUAGE_SERVERS=0 or INSTALL_PLUGINS=0 when only refreshing config.
install_language_servers="${INSTALL_LANGUAGE_SERVERS:-1}"
install_plugins="${INSTALL_PLUGINS:-1}"

# config
mkdir -p "$config_dir"
rm -rf "$config_dir/lua" "$config_dir/after"
rm -f "$config_dir/lazy-lock.json"
cp "$script_dir/init.lua" "$config_dir/"
cp -R "$script_dir/lua" "$script_dir/after" "$config_dir/"

# lazy.nvim
if [ ! -d "$lazy_dir/.git" ]; then
  mkdir -p "$(dirname "$lazy_dir")"
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git "$lazy_dir"
fi

# Language servers
# yarn global add bash-language-server
if [ "$install_language_servers" = "1" ]; then
  # css, html, json server
  if command -v yarn >/dev/null 2>&1; then
    yarn global add vscode-langservers-extracted typescript typescript-language-server
  elif command -v npm >/dev/null 2>&1; then
    npm install -g vscode-langservers-extracted typescript typescript-language-server
  else
    echo "skip JavaScript/TypeScript language servers: npm/yarn not found"
  fi

  # golang
  if command -v go >/dev/null 2>&1; then
    go install golang.org/x/tools/gopls@latest
  else
    echo "skip gopls: go not found"
  fi
fi

if [ "$install_plugins" = "1" ] && command -v nvim >/dev/null 2>&1; then
  rm -f "$state_dir/lazy-lock.json"
  nvim --headless "+Lazy! sync" "+qa"
fi
