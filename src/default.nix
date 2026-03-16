{ pkgs, ... }: {
  imports = [
    ./general.nix
    ./gh.nix
    ./git.nix
    ./vscode.nix
    ./direnv.nix
    ./vnc
  ];
}
