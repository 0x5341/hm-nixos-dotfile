{ ... }: {
  imports = [
    ./wayvnc.nix
    ./compositor.nix
    ./novnc.nix
    ./lavapipe.nix
  ];
  home.sessionVariables = {
    WAYLAND_DISPLAY = "wayland-1";
  };
}
