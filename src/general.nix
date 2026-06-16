{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devbox
    ghq
  ];
  programs.bash.enable = true;
  programs.zoxide.enable = true;
  programs.antigravity-cli = {
    enable = true;
  };
  programs.lazygit.enable = true;
}
