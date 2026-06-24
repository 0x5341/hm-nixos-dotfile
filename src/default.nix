{ pkgs, ... }:
{
  imports = [
    # ./vnc
    ./context-mode.nix
    ./copilot.nix
    ./direnv.nix
    ./fresh.nix
    ./general.nix
    ./gh.nix
    ./git.nix
    ./neovim
    ./nushell.nix
    ./opencode.nix
    ./vscode.nix
    ./zed-server.nix
    ./zellij.nix
  ];
}
