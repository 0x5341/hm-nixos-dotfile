{ config, ... }: {
  wayland.windowManager.river = {
    enable = true;
  };

  systemd.user.services."wayland-wm" = {
    Unit.Description = ''
        Wayland Compositor (headless)
      '';
    Unit.After = "network.target";
    Unit.X-SwitchMethod = "stop-start";
    Service.ExecStart = "/etc/profiles/per-user/${config.home.username}/bin/river";
    Service.Environment = [
      "WLR_BACKENDS=headless"
      "WLR_NO_HARDWARE_CURSORS=1"
      "WLR_RENDERER=pixman"
      "WLR_RENDERER_FORCE_SOFTWARE=1"
      "WLR_LIBINPUT_NO_DEVICES=1"
    ];
    Install.WantedBy = ["default.target"];
  };
}
