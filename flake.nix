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
    poetry2nix.url = "github:nix-community/poetry2nix";
    # some plugins that I track outside of nixpkgs and vim-extra-plugins

    drop-nvim = {
      url = "github:folke/drop.nvim";
      flake = false;
    };
    astro-vim = {
      url = "github:wuelnerdotexe/vim-astro";
      flake = false;
    };
    cyclist-nvim = {
      url = "github:tjdevries/cyclist.vim";
      flake = false;
    };

    autosave-nvim = {
      url = "github:Pocco81/auto-save.nvim";
      flake = false;
    };
    noice-nvim = {
      url = "github:folke/noice.nvim";
      flake = false;
    };
    typescript-nvim = {
      url = "github:jose-elias-alvarez/typescript.nvim";
      flake = false;
    };
    lspcontainers-nvim = {
      url = "github:lspcontainers/lspcontainers.nvim";
      flake = false;
    };
    nvim-dap-go = {
      url = "github:leoluz/nvim-dap-go";
      flake = false;
    };

  };
  outputs = inputs@{ nixpkgs, home-manager, flake-utils, neovim-nightly, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      overlays = [ inputs.neovim-nightly.overlay inputs.vim-extra-plugins.overlays.default inputs.poetry2nix.overlay ];

    in
    {
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
              # the magic keywords LUL
              home-manager.extraSpecialArgs = { inherit system inputs; };
              home-manager.users.adgai = import ./users/adgai/home.nix;
            }
          ];

        };
      };
    };
}
