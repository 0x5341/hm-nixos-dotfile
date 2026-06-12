{ ... }:
{
  imports = [
    ./wayvnc.nix
    ./compositor.nix
    ./novnc.nix
    ./lavapipe.nix
    ./font.nix
  ];
  programs.nushell.environmentVariables = {
    WAYLAND_DISPLAY = "wayland-1";
    DISPLAY = ":0";
  };
}
