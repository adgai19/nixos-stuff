{

  description = "Random nix stuff. Nixos+home-manager+neovim";

  nixConfig = {
    extra-substituters = " https://nix-community.cachix.org https://adgai19.cachix.org";
    extra-trusted-public-keys = " nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs= adgai19.cachix.org-1:AkyyWarR6y2bfy3YPYLrKjjoLlzUvyKNhvflZ+eW3tk=";
    extra-experimental-features = "nix-command flakes";
  };

  inputs = {
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
    rustaceanvim = {
      url = "github:mrcjkb/rustaceanvim/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vim-sops = {
      url = "github:jsecchiero/vim-sops";
      flake = false;
    };
    harpoon-nvim = {
      url = "github:ThePrimeagen/harpoon?ref=harpoon2";
      flake = false;
    };

    nixpkgs = {
      # url = "github:NixOS/nixpkgs/nixos-24.05";
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    stylix.url = "github:danth/stylix";
    nixpkgs-unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixpkgs-unstable-small = { url = "github:nixos/nixpkgs/nixos-unstable-small"; };

    nixpkgs-stable = { url = "github:NixOS/nixpkgs/nixos-24.05"; };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-overlay = {
      url = "github:mozilla/nixpkgs-mozilla";
    };
    firefox-nightly = {
      url = "github:nix-community/flake-firefox-nightly";
    };

    tokyonight-tmux = {
      url = "github:janoamaral/tokyo-night-tmux";
      flake = false;
    };

    base16-tmux = {
      url = "github:tinted-theming/base16-tmux";
      flake = false;
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # some plugins that I track outside of nixpkgs
    inc-rename = {
      url = "github:smjonas/inc-rename.nvim";
      flake = false;
    };

    vim-just = {
      url = "github:NoahTheDuke/vim-just";
      flake = false;
    };

    treesitter-just = {
      url = "github:IndianBoy42/tree-sitter-just";
      flake = false;
    };
    regexplainer = {
      url = "github:bennypowers/nvim-regexplainer";
      flake = false;
    };

    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
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

    astro-vim = {
      url = "github:wuelnerdotexe/vim-astro";
      flake = false;
    };

    cyclist-nvim = {
      url = "github:tjdevries/cyclist.vim";
      flake = false;
    };

    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
    autosave-nvim = {
      url = "github:Pocco81/auto-save.nvim";
      flake = false;
    };

    typescript-nvim = {
      url = "github:jose-elias-alvarez/typescript.nvim";
      flake = false;
    };

    noice-nvim = {
      url = "github:folke/noice.nvim";
      flake = false;
    };

    nvim-dap-go = {
      url = "github:leoluz/nvim-dap-go";
      flake = false;
    };

    statuscol-nvim = {
      url = "github:luukvbaal/statuscol.nvim";
      flake = false;
    };

    hover-nvim = {
      url = "github:lewis6991/hover.nvim";
      flake = false;
    };

    jester = {
      url = "github:David-Kunz/jester";
      flake = false;
    };

    neotest-jest = {
      url = "github:haydenmeade/neotest-jest";
      flake = false;
    };

    dap-vscode = {
      url = "github:mxsdev/nvim-dap-vscode-js";
      flake = false;
    };

    treesj = {
      url = "github:Wansmer/treesj";
      flake = false;
    };
    vim-base64 = {
      url = "github:christianrondeau/vim-base64";
      flake = false;
    };

    qmk-nvim = {
      url = "github:codethread/qmk.nvim";
      flake = false;
    };

    json2struct = {
      url = "github:marhaupe/json2struct";
      flake = false;
    };

    bumblebee-status = {
      url = "github:tobi-wan-kenobi/bumblebee-status";
      flake = false;
    };

    wezterm = {
      url = "github:wez/wezterm/main?dir=nix";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "git+ssh://git@github-personal/ghostty-org/ghostty";

      # NOTE: The below 2 lines are only required on nixos-unstable,
      # if you're on stable, they may break your build
      inputs.nixpkgs-stable.follows = "nixpkgs";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
    };

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ home-manager, neovim-nightly, nixpkgs, nixpkgs-unstable, nixpkgs-unstable-small, self, sops-nix, firefox-nightly, neorg-overlay, stylix, nixpkgs-stable, wezterm, nix-darwin, ... }:
    let
      system = "x86_64-linux";
        linuxSystem = "x86_64-linux";
  macSystem = "aarch64-darwin";

   pkgsLinux = import nixpkgs {
    system = linuxSystem;
    config = { allowUnfree = true; };
  };

  pkgsMac = import nixpkgs {
    system = macSystem;
    config = { allowUnfree = true; };
  };

      pkgs = import nixpkgs {
        inherit linuxSystem;
        config = { allowUnfree = true; };
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit linuxSystem;
        config = { allowUnfree = true; };
      };

      pkgs-stable = import nixpkgs-stable {
        inherit linuxSystem;
        config = { allowUnfree = true; };
      };

      pkgs-unstable-small = import nixpkgs-unstable-small {
        inherit linuxSystem;
        config = { allowUnfree = true; };
      };

     pkgs-mac = import nixpkgs {
        inherit macSystem;
        config = { allowUnfree = true; };
      };
      pkgs-unstable-mac = import nixpkgs-unstable {
        inherit macSystem;
        config = { allowUnfree = true; };
      };

      pkgs-stable-mac = import nixpkgs-stable {
        inherit macSystem;
        config = { allowUnfree = true; };
      };

      pkgs-unstable-small-mac = import nixpkgs-unstable-small {
        inherit macSystem;
        config = { allowUnfree = true; };
      };

      overlays = [
        neovim-nightly.overlays.default
        inputs.poetry2nix.overlays.default
        self.overlays.default
        neorg-overlay.overlays.default
      ];

      overlays-mac = [
        neovim-nightly.overlays.default
        inputs.poetry2nix.overlays.default
        self.overlays-mac.default
        neorg-overlay.overlays.default
      ];

    in
    {

      devShells."${system}".default = pkgs.mkShellNoCC {
        packages = with pkgs;[ git zsh nixpkgs-fmt just ];
        shellHook = ''echo Inside nix dev shell'';
      };

      nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

      # packages."${system}" = import ./packages inputs pkgs;

      packages = {
        "x86_64-linux" = import ./packages.nix inputs pkgs;
      };

      packages-mac = {
        "aarch64-darwin" = import ./packages.nix inputs pkgs-mac;
      };

      overlays = import ./users/common/overlays.nix inputs self.packages;

      # overlays-mac = import ./users/common/overlays.nix inputs self.packages-mac;

      homeConfigurations = {
        ubuntu-vm = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/ubunbu-vm/home.nix ];
        };
      };

      nixosConfigurations = {
        legion = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            {
              _module.args = {
                inherit inputs system;

              };
            }
            ./system/legion/configuration.nix
            sops-nix.nixosModules.sops
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {

              nixpkgs.overlays = overlays;
              home-manager.backupFileExtension = "bak";
              stylix.fonts.sizes.applications = 10;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit system inputs pkgs-unstable pkgs-stable pkgs-unstable-small; };
              home-manager.users.adgai = import ./hosts/legion/home.nix;
            }
          ];

        };

        vms = nixpkgs.lib.nixosSystem {
          inherit system;
        };

      };


      darwinConfigurations = {
        Adityas-MacBook-Pro =nix-darwin.lib.darwinSystem {
         modules = [
         ./system/darwin/configuration.nix 

 {
              # _module.args = {
              #   inherit inputs ;
              #   system = "aarch64-darwin";
              #   pkgs = pkgs-mac;

              # };
            }
             home-manager.darwinModules.home-manager
             {
              # nixpkgs.overlays = overlays-mac;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # the magic keywords LUL
              home-manager.extraSpecialArgs = { inherit  inputs pkgs-unstable-mac pkgs-stable-mac; 
              system = "aarch64-darwin"; };
              # system = "aarch64-darwin"; };
              home-manager.users.adgai = import ./hosts/mac/home.nix ;
            }
         ];
      };
      };
    };
}
