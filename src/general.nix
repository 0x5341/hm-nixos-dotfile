{ pkgs, ... }: {
  home.packages = with pkgs; [
    devbox
    ghq
  ];
  programs.direnv.enable = true;
}
