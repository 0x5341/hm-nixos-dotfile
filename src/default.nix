{ pkgs, ... }:
{
  imports = [
    # ./vnc
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
