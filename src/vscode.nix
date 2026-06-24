{ config, pkgs, ... }:
{
  programs.vscode.enable = true;

  home.packages = with pkgs; [
    nixfmt-tree
    nixd
  ];

  systemd.user.services."vscode" = {
    Unit.Description = "VsCode Server";
    Unit.After = "network.target";
    Unit.X-SwitchMethod = "stop-start";
    Service.ExecStart = ''/run/current-system/sw/bin/bash -ic "code serve-web --host 0.0.0.0 --port 8000 --without-connection-token"'';
    Service.Restart = "always";
    Service.RuntimeMaxSec = 86400;
    Install.WantedBy = [ "default.target" ];
  };
}
