{nixvim, pkgs, ...}: {
  imports = [nixvim.homeModules.nixvim];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.pkgs = pkgs;

    performance.byteCompileLua = {
      enable = true;
      luaLib = true;
      nvimRuntime = true;
      plugins = true;
    };
  };
}
