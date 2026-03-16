{ pkgs, ... }: {
  home.packages = with pkgs; [
    mesa
    vulkan-tools
  ];
}
