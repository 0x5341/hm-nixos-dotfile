{ pkgs, ... }: {
  home.packages = with pkgs; [
    devbox
    ghq
  ];
}
