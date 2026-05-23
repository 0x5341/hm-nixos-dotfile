{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devbox
    ghq
  ];
  programs.bash.enable = true;
  programs.zoxide.enable = true;
  programs.github-copilot-cli.enable = true;
  programs.gemini-cli = {
    enable = true;
    settings.security.auth.selectedType = "oauth-personal";
  };
  programs.lazygit.enable = true;
}
