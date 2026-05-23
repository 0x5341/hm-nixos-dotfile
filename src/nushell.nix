{ ... }:
{
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
    shellAliases = {
      "lg" = "lazygit";
    };
  };
  programs.starship = {
    enable = true;
    presets = [ "jetpack" ];
    settings = {
      hostname.disabled = true;
      username.disabled = true;
      localip.disabled = true;
      sudo.disabled = true;
      time.disabled = false;
      memory_usage.disabled = false;
    };
  };
}
