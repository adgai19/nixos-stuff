{
  description = "My nix config";

  inputs = {
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    poetry2nix.url = "github:nix-community/poetry2nix";
    # some plugins that I track outside of nixpkgs and vim-extra-plugins

    inc-rename = {
      url = "github:smjonas/inc-rename.nvim";
      flake = false;
    };

    regexplainer = {
      url = "github:bennypowers/nvim-regexplainer";
      flake = false;
    };
    go-nvim = {
      url = "github:ray-x/go.nvim";
      flake = false;
    };

    guihua-nvim = {
      url = "github:ray-x/guihua.lua";
      flake = false;
    };
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
    firefox-overlay = {
      url = "github:mozilla/nixpkgs-mozilla";
    };
    tokyonight-tmux = {
      url = "github:janoamaral/tokyo-night-tmux";
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

      overlays = [
        inputs.neovim-nightly.overlay
        inputs.poetry2nix.overlay
        inputs.firefox-overlay.overlay
        (import ./users/adgai/overlays.nix inputs)
      ];

    in
    {
      devShells."${system}".default = pkgs.mkShellNoCC {
        packages = with pkgs;[ git zsh nixpkgs-fmt ];
        shellHook = ''echo Inside nix dev shell'';
      };

      packages."${system}" = import ./packages inputs;
      nixosConfigurations = {
        legion = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./system/legion/configuration.nix
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
        vms = nixpkgs.lib.nixosSystem {
          inherit system;
        };
      };
    };
}
