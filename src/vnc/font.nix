{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mplus-outline-fonts.githubRelease
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontconfig.enable = true;
}
