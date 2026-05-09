{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devbox
    ghq
    github-copilot-cli
  ];
  programs.bash.enable = true;
  programs.zoxide.enable = true;
}
