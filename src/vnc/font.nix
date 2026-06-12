{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontconfig.enable = true;
}
