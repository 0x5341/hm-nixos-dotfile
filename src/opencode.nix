{pkgs,...}:{
  programs.opencode = {
    enable = true;
    web.enable = true;
    web.extraArgs = [
      "--port" "4000"
      "--hostname" "0.0.0.0"
    ];
  };
}
