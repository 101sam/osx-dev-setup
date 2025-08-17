# OSX Dev Setup

Developer setup scripts, dotfiles, and helpers for macOS machines.  
Designed to bootstrap a consistent environment across new computers.

---

## What’s included
- `.aliases` — handy shell aliases
- `.functions` — reusable functions (e.g., Cloudflare tunnels, upgrades, secrets loader)
- `.zshrc` tail — loads dotfiles, vault secrets, and environment settings
- Vaulted secrets support (`~/.vault/`)

---

## Quick Start

### 1. Clone the repo
```bash
git clone https://github.com/101sam/osx-dev-setup.git ~/osx-dev-setup
cd ~/osx-dev-setup
```

### 2. Link dotfiles
```bash
ln -s ~/osx-dev-setup/.aliases ~/.aliases
ln -s ~/osx-dev-setup/.functions ~/.functions
```

### 3. Setup vault
Store sensitive tokens in `~/.vault` (never commit them):
```bash
mkdir -p ~/.vault ~/.vault/machine
echo "ghp_xxxxx" > ~/.vault/github_token
chmod 600 ~/.vault/github_token
```

### 4. Update `.zshrc`
At the end of your `~/.zshrc`, add:
```zsh
source ~/osx-dev-setup/zshrc-tail.zsh
```

### 5. Reload
```bash
source ~/.zshrc
```

### 6) Install Homebrew packages
This repo includes a `Brewfile` snapshot of required formulae and apps.

We export using:
```bash
brew bundle dump --file=~/osx-dev-setup/Brewfile --force
```

To install:
```bash
brew bundle --file=~/osx-dev-setup/Brewfile
```
---

## Vault Secrets
- `~/.vault/github_token` → `GITHUB_TOKEN`
- `~/.vault/vercel_TURBO_TOKEN_101SAM` → `TURBO_TOKEN`
- `~/.vault/machine/<hostname>.env` → host-specific settings

---

## Cloudflare Tunnel Helpers
```bash
cf-create <PORT>       # Create a tunnel
cf-start <PORT> --log  # Start and log
cf-open <PORT>         # Open in browser
cf-delete <PORT>       # Delete one
cf-delete-all --force  # Delete all
```

---

## Maintenance Helpers
- `awscli-upgrade` → upgrade AWS CLI
- `gcloud-upgrade` → upgrade Google Cloud SDK
- `brew-upgrade-safe` → safe Brew upgrade (avoids breaking deps)

---

## License
This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.

