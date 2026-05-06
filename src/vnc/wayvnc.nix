{ config, ... }:
{
  services.wayvnc = {
    enable = true;
    settings.address = "0.0.0.0";
    settings.port = 5901;
  };

  systemd.user.services."wayvnc-launch" = {
    Unit.Description = "wayvnc launch after wayland-wm launched";
    Unit.After = "wayland-wm.service";
    Unit.X-SwitchMethod = "stop-start";
    Service.Restart = "always";
    Service.ExecStart = "/etc/profiles/per-user/${config.home.username}/bin/wayvnc -f 60";
    Service.Environment = [
      "WAYLAND_DISPLAY=wayland-1"
    ];
    Install.WantedBy = [ "default.target" ];
  };
}
