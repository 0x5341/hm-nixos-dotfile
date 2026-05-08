{ pkgs, ... }:
{
  imports = [
    # ./vnc
    ./direnv.nix
    ./fresh.nix
    ./general.nix
    ./gh.nix
    ./git.nix
    ./vscode.nix
    ./zellij.nix
  ];
}
