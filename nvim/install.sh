#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/nvim"
lazy_dir="$data_dir/lazy/lazy.nvim"

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# Set INSTALL_SYSTEM_DEPS=0, INSTALL_LANGUAGE_SERVERS=0, or INSTALL_PLUGINS=0
# when only refreshing config.
install_system_deps="${INSTALL_SYSTEM_DEPS:-1}"
install_language_servers="${INSTALL_LANGUAGE_SERVERS:-1}"
install_plugins="${INSTALL_PLUGINS:-1}"

install_brew_formula() {
  local formula="$1"
  local command_name="${2:-$1}"

  if command -v "$command_name" >/dev/null 2>&1; then
    return
  fi

  if command -v brew >/dev/null 2>&1; then
    brew install "$formula"
  else
    echo "missing $command_name: install $formula first, or install Homebrew and rerun this script" >&2
    return 1
  fi
}

if [ "$install_system_deps" = "1" ]; then
  install_brew_formula neovim nvim
  install_brew_formula tree-sitter-cli tree-sitter
fi

if ! command -v git >/dev/null 2>&1; then
  echo "missing git: install git first" >&2
  exit 1
fi

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
  nvim --headless -i NONE "+Lazy! sync" "+qa"
  nvim --headless -i NONE \
    "+lua require('nvim-treesitter').install({'html','css','lua','javascript','typescript','tsx','go','bash','comment','markdown'}, {summary = true}):wait(300000)" \
    "+qa"
fi
