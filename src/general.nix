{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devbox
    ghq
  ];
  programs.bash.enable = true;
  programs.zoxide.enable = true;
  programs.github-copilot-cli = {
    enable = true;
    package = pkgs.github-copilot-cli.overrideAttrs (
      final: prev: {
        version = "1.0.61";
        src = pkgs.fetchurl {
          url = "https://github.com/github/copilot-cli/releases/download/v${final.version}/github-copilot-${final.version}.tgz";
          hash = "sha256-8Lks8lHa5XF9ZrC+fU/9VlzD1W32MbRZ7PZtL5YWLTA=";
        };
      }
    );
    enableMcpIntegration = true;
    mcpServers = {
      "context-mode" = {
        type = "local";
        command = "context-mode";
        tools = ["*"];
      };
    };
    settings = {
      hooks = {
        PreToolUse = [
          {
            type = "command";
            command = "context-mode hook vscode-copilot pretooluse";
          }
        ];

        PostToolUse = [
          {
            type = "command";
            command = "context-mode hook vscode-copilot posttooluse";
          }
        ];

        PreCompact = [
          {
            type = "command";
            command = "context-mode hook vscode-copilot precompact";
          }
        ];

        SessionStart = [
          {
            type = "command";
            command = "context-mode hook vscode-copilot sessionstart";
          }
        ];
      };
    };
  };
  programs.antigravity-cli = {
    enable = true;
  };
  programs.lazygit.enable = true;
}
