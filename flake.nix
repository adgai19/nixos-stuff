{
  description = "My nix config";

  inputs = {
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    vim-extra-plugins.url = "github:m15a/nixpkgs-vim-extra-plugins";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs@{ nixpkgs, home-manager, flake-utils, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      discord-overlay = (import (builtins.fetchTarball {
        url = "https://github.com/InternetUnexplorer/discord-overlay/archive/main.tar.gz";
      }));

      overlays = [ inputs.neovim-nightly.overlay inputs.vim-extra-plugins.overlays.default discord-overlay ];

    in
    {
      # devShell."${system}".default = import ./shell.nix ;
      devShells."${system}".default = pkgs.mkShellNoCC {
        packages = with pkgs;[ git zsh nixpkgs-fmt ];
        shellHook = ''echo Inside nix dev shell'';


      };

      nixosConfigurations = {
        adgai = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./system/configuration.nix

            home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = overlays;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.adgai = import ./users/adgai/home.nix;
            }
          ];

        };
      };
    };
}
