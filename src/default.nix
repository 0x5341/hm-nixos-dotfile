{ pkgs, ... }:
{
  imports = [
    # ./vnc
    ./context-mode.nix
    ./direnv.nix
    ./fresh.nix
    ./general.nix
    ./gh.nix
    ./git.nix
    ./nushell.nix
    ./vscode.nix
    ./zellij.nix
  ];
}
