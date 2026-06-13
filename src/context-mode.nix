{ bun2nix, context-mode, pkgs, lib, config, ... }:
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
        bun build ./cli.bundle.mjs --compile --outfile context-mode
      '';
      installPhase = ''
        mkdir -p $out/bin
        cp ./context-mode $out/bin/context-mode
      '';
      dontStrip = true;
    });
in {
  home.packages = [
    (buildBunPackage {
      src = context-mode;
      pname = "context-mode";
      version = "main";
    })
    pkgs.bun
  ];
}