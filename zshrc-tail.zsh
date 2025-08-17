# ###############################################################################################
# Kids on the Yard — Zsh tail: loads local dotfiles, tools, completions, and secure secrets
# Paste this block at the very end of ~/.zshrc on new machines.
# ###############################################################################################

# ---- Load local dotfiles if present ------------------------------------------------------------
# ~/.exports, ~/.aliases, ~/.functions, ~/.extra are optional
for file in ~/.{exports,aliases,functions,extra}; do
  [[ -r "$file" && -f "$file" ]] && source "$file"
done
unset file

# ---- Node Version Manager (NVM) ----------------------------------------------------------------
# Use Homebrew location on Apple Silicon when available; fall back to ~/.nvm
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
[[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]] && export NVM_DIR="/opt/homebrew/opt/nvm"  # prefer brew path

# shellcheck disable=SC1090
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"

# Only auto-select default in interactive shells to avoid slowing scripts
if [[ -n "$PS1" ]] && command -v nvm >/dev/null 2>&1; then
  nvm use default >/dev/null 2>&1
fi

# ---- Secure secrets from ~/.vault (files, chmod 600) -------------------------------------------
# Helper: load a secret from file if readable (also available in ~/.functions, but keep a mini copy here)
load_secret() {
  local var="$1" path="$2" required="${3:-}"
  if [[ -r "$path" ]]; then
    # Strip potential trailing CR
    local val; val="$(<"$path")"; val="${val%%$'\r'}"
    export "$var=$val"
  else
    if [[ "$required" == "--required" ]]; then
      print -u2 "Error: $path not found or unreadable; $var unset"
      return 1
    else
      print -u2 "Warning: $path not found or unreadable; $var unset"
    fi
  fi
}

# GitHub Personal Token (store in ~/.vault/github_token; never inline in the file)
load_secret GITHUB_TOKEN "$HOME/.vault/github_token"

# Vercel Turbo Remote Cache token (Team: kidsontheyard)
export TURBO_CACHE="remote:rw"
export TURBO_TEAM="kidsontheyard"
load_secret TURBO_TOKEN "$HOME/.vault/vercel_TURBO_TOKEN_101SAM"

# Machine-specific overrides (per-host). Create file and add exports as needed.
# Examples: CF_BASE_DOMAIN, service URLs, per-box API keys, etc.
HOST_SHORT="$(hostname -s 2>/dev/null || hostname)"
[[ -r "$HOME/.vault/machine/${HOST_SHORT}.env" ]] && source "$HOME/.vault/machine/${HOST_SHORT}.env"

# ---- PATH setup & de-dup -----------------------------------------------------------------------
# pnpm (use user path, avoid hardcoding username)
export PNPM_HOME="$HOME/Library/pnpm"
[[ -d "$PNPM_HOME" ]] && PATH="$PNPM_HOME:$PATH"

# Add ~/.local/bin without quoting ~ (so it expands)
PATH="$HOME/.local/bin:$PATH"

# Deduplicate PATH segments (order preserved)
path_dedup() {
  awk -v RS=: -v ORS=: '!seen[$0]++' <<<"$PATH" | sed 's/:$//'
}
export PATH="$(path_dedup)"; unset -f path_dedup

# ---- Docker CLI completions (safe compinit) ----------------------------------------------------
# Note: compinit can complain about insecure directories; -i ignores those warnings at login.
fpath=("$HOME/.docker/completions" $fpath)
autoload -Uz compinit
compinit -i

# ---- Handy aliases -----------------------------------------------------------------------------
# Claude local launcher
alias claude="$HOME/.claude/local/claude"

# Quick system info
alias path='echo -e "${PATH//:/\n}"'
alias whichall='type -a'

# ---- Nice prompts for first-run ----------------------------------------------------------------
if [[ -n "$PS1" ]]; then
  [[ -z "$GITHUB_TOKEN" ]] && print -u2 "Note: GITHUB_TOKEN not set. Put it in $HOME/.vault/github_token (chmod 600)."
  [[ -z "$TURBO_TOKEN"  ]] && print -u2 "Note: TURBO_TOKEN not set. Put it in $HOME/.vault/vercel_TURBO_TOKEN_101SAM (chmod 600)."
fi