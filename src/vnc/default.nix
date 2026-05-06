{ ... }:
{
  imports = [
    ./wayvnc.nix
    ./compositor.nix
    ./novnc.nix
    ./lavapipe.nix
    ./font.nix
  ];
  home.sessionVariables = {
    WAYLAND_DISPLAY = "wayland-1";
    DISPLAY = ":0";
  };
}
