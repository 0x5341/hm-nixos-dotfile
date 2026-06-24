{
  bun2nix,
  context-mode,
  pkgs,
  lib,
  config,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
  bun2nixLib = bun2nix.packages.${system}.default;
  bun2nixPkg = bun2nix.packages.${system};
  buildBunPackage = (
    {
      pname,
      version,
      src,
    }:
    let
      makeBunNix = pkgs.stdenv.mkDerivation {
        pname = pname + "-bun2nix";
        version = version;
        src = src;
        nativeBuildInputs = [
          bun2nixPkg.default
        ];
        buildPhase = ''
          bun2nix -o bun2nix.nix 
        '';
        installPhase = ''
          cp ./bun2nix.nix $out
        '';
        outputHashAlgo = "sha256";
        outputHashMode = "flat";
        outputHash = "sha256-ivcIrJqkaXoQvukj7UPuakQFDoRgB2JH5Wqlvh2gpHw=";
      };
      bunDeps = bun2nixLib.fetchBunDeps {
        bunNix = builtins.path { path = makeBunNix; };
      };
    in
    pkgs.stdenv.mkDerivation {
      pname = pname;
      version = version;
      src = src;
      bunDeps = bunDeps;
      nativeBuildInputs = [
        pkgs.bun
        bun2nixLib.hook
      ];
      buildPhase = ''
        bun run build
      '';
      installPhase = ''
        mkdir -p $out
        cp -r . $out/
      '';
      dontStrip = true;
    }
  );
in
{
  home.packages = [
    (
      let
        ctx = buildBunPackage {
          src = context-mode;
          pname = "context-mode";
          version = "main";
        };
      in
      pkgs.writeShellScriptBin "context-mode" ''
        #! /bin/sh
        ${pkgs.bun}/bin/bun ${ctx}/cli.bundle.mjs "$@"
      ''
    )
    pkgs.bun
  ];
}
