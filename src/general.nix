{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devbox
    ghq
  ];
  programs.bash.enable = true;
}
