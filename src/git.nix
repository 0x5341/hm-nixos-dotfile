{
  programs.git = {
    enable = true;
    settings = {
      user.name = "0x5341";
      user.email = "107183580+0x5341@users.noreply.github.com";
      init.defaultBranch = "main";
    };
    ignores = [
      "devbox.json"
      "devbox.lock"
      ".envrc"
      "flake.nix"
    ];
  };
}
