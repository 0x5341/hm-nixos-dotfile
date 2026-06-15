# Copilot instructions for this repository

## Commands

- Apply the full NixOS + Home Manager configuration:
  ```bash
  sudo nixos-rebuild switch --flake .#nixos
  ```
- Validate the flake:
  ```bash
  nix flake check
  ```
- Format Nix files:
  ```bash
  nixfmt path/to/file.nix
  ```
- There is no dedicated test suite or single-test command defined in this repository.

## High-level architecture

- `flake.nix` is the entry point. It defines one NixOS host, `nixos`, for `aarch64-linux`, and wires Home Manager into the system config.
- System-level settings live under `nixos/`; user-level Home Manager settings live in `0x5341.nix` and `src/`.
- `src/default.nix` is the shared Home Manager module bundle. It imports one module per feature.
- `src/context-mode.nix` builds and exposes the local `context-mode` binary with `bun2nix`; `src/general.nix` connects that tooling to GitHub Copilot CLI and MCP hooks.
- `src/vnc/` contains an optional headless Wayland stack (Sway, wayvnc, noVNC, software rendering). It is currently disabled by default in `src/default.nix`.

## Key conventions

- Keep user-specific config in `0x5341.nix`; keep shared reusable config in `src/`.
- Prefer small, feature-focused Nix modules and import them from `src/default.nix` instead of growing one large file.
- When changing AI/tooling behavior, keep `src/general.nix`, `src/context-mode.nix`, and the flake `home-manager.extraSpecialArgs` wiring in sync.
- Preserve the existing host and user identities: host `nixos`, user `0x5341`.
- Existing defaults are intentional: Catppuccin is enabled with `frappe` / `sky`, Zellij defaults to `nu`, and Git uses the configured noreply identity and `main` as the default branch.
