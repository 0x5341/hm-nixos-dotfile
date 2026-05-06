{ pkgs, ... }:
{
  home.username = "0x5341";
  home.homeDirectory = "/home/0x5341";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  imports = [
    ./src
  ];
}
