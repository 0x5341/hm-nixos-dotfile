{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
    bun2nix.url = "github:nix-community/bun2nix";
    bun2nix.inputs.nixpkgs.follows = "nixpkgs";
    context-mode.url = "github:mksglu/context-mode";
    context-mode.flake = false;
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      catppuccin,
      bun2nix,
      context-mode,
      ...
    }:
    {
      nixosConfigurations = {
        "nixos" = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [
                {
                  imports = [ catppuccin.homeModules.catppuccin ];
                  catppuccin.enable = true;
                  catppuccin.accent = "sky";
                  catppuccin.flavor = "frappe";
                }
                {
                  programs.home-manager.enable = true;

                  imports = [
                    ./src
                  ];
                }
              ];
              home-manager.users."0x5341" = ./0x5341.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
              home-manager.extraSpecialArgs = {
                  "bun2nix" = bun2nix;
                  "context-mode" = context-mode;
              };
            }
          ];
        };
      };
    };
}
