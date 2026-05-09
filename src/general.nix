{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devbox
    ghq
  ];
  programs.bash.enable = true;
  programs.zoxide.enable = true;
  programs.github-copilot-cli.enable = true;
  programs.gemini-cli.enable = true;
  programs.lazygit.enable = true;
}
