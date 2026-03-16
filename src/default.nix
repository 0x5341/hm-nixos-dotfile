{ pkgs, ... }: {
  imports = [
    ./general.nix
    ./gh.nix
    ./git.nix
    ./vscode.nix
    ./vnc
  ];
}
