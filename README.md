# dotfiles

Nix flake for **NixOS** and **Home Manager** on my `nixos` host.

## What this repo configures

- **System**: NixOS on `aarch64-linux`, `systemd-boot`, NetworkManager, SSH, `nix-ld`, and Tailscale
- **User**: Home Manager for `0x5341`
- **Shell/tools**: Nushell, Bash, Starship, Zellij, Direnv, Git, GitHub CLI, Lazygit, Devbox, ghq
- **Editor/runtime**: VS Code, nixd, nixfmt, Fresh, Bun
- **Agent tooling**: GitHub Copilot CLI with MCP integration and `context-mode` hooks
- **Optional remote desktop stack**: headless Sway + wayvnc + noVNC modules are present, but not enabled by default

## Layout

```text
flake.nix           # Flake entry point and nixosConfigurations
0x5341.nix          # Home Manager user config
src/                # Shared Home Manager modules
src/vnc/            # Optional headless Wayland/VNC setup
nixos/              # NixOS system configuration
```

## Key modules

- `src/general.nix` - common packages and CLI tooling
- `src/context-mode.nix` - builds and exposes the local `context-mode` binary
- `src/direnv.nix` - direnv + nix-direnv
- `src/git.nix` - Git identity and ignores
- `src/gh.nix` - GitHub CLI + git credential helper
- `src/nushell.nix` - Nushell and Starship
- `src/vscode.nix` - VS Code and related services
- `src/zellij.nix` - Zellij defaults
- `nixos/configuration.nix` - host-level NixOS settings
- `nixos/nix-ld.nix` - enables `nix-ld`
- `nixos/tailscale.nix` - enables Tailscale with SSH

## Apply the configuration

```bash
sudo nixos-rebuild switch --flake .#nixos
```

## Notes

- The flake targets `nixos` and expects the user `0x5341`.
- Home Manager is wired directly into the NixOS configuration.
- `src/vnc` is available for a headless Wayland/VNC session, but it is currently commented out in `src/default.nix`.
