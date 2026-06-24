{ ... }: {
  programs.mcp = {
    enable = true;
    servers = {
      "context-mode" = {
        command = "context-mode";
      };
    };
  };
}
