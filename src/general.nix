{ pkgs, ... }: {
  home.packages = with pkgs; [
    devbox
    ghq
  ];
  programs.direnv.enable = true;
  programs.bash.enable = true;
}
