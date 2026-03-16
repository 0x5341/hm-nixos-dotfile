{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    novnc
  ];

  systemd.user.services."novnc" = {
    Unit.Description = "Novnc Server";
    Unit.After = "wayvnc-launch.service";
    Unit.X-SwitchMethod = "stop-start";
    Service.ExecStart = "/etc/profiles/per-user/${config.home.username}/bin/novnc --vnc localhost:5901 --listen localhost:4000";
    Service.Environment = [
      "PATH=/run/current-system/sw/bin/"
    ];
    Install.WantedBy = ["default.target"];
  };
}
