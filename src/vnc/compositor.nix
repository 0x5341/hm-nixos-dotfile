{ config, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config.output = {
      HEADLESS-1 = {
        mode = "1200x850@60Hz";
        bg = "#8be5ea solid_color";
      };
    };

    config.input = {
      "type:keyboard" = {
        xkb_layout = "jp";
        xkb_model = "microsoftsurface";
      };
    };
  };

  systemd.user.services."wayland-wm" = {
    Unit.Description = ''
      Wayland Compositor (headless)
    '';
    Unit.After = "network.target";
    Unit.X-SwitchMethod = "stop-start";
    Service.Restart = "always";
    Service.ExecStart = ''/run/current-system/sw/bin/bash -ic "sway"'';
    Service.Environment = [
      "WLR_BACKENDS=headless"
      "WLR_NO_HARDWARE_CURSORS=1"
      "WLR_RENDERER=pixman"
      "WLR_RENDERER_FORCE_SOFTWARE=1"
      "WLR_LIBINPUT_NO_DEVICES=1"
    ];
    Install.WantedBy = [ "default.target" ];
  };
}
