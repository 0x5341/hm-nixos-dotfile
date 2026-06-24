{ pkgs, context-mode, ... }: {
  programs.opencode = {
    enable = true;
    web.enable = true;
    web.extraArgs = [
      "--port"
      "4000"
      "--hostname"
      "0.0.0.0"
    ];
    settings = {
      plugin = [
        "@simonwjackson/opencode-direnv"
        "context-mode"
      ];
    };
    context = (builtins.readFile (context-mode + "/configs/opencode/AGENTS.md"));
  };
  home.packages = [ pkgs.bun ];
}
