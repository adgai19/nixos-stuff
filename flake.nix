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

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    stylix.url = "github:danth/stylix";
    nixpkgs-unstable.follows = "nixpkgs";
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

    #
    base16-tmux = {
      url = "github:tinted-theming/base16-tmux";
      flake = false;
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "git+ssh://git@github-personal/ghostty-org/ghostty";

      # NOTE: The below 2 lines are only required on nixos-unstable,
      # if you're on stable, they may break your build
      # inputs.nixpkgs-stable.follows = "nixpkgs";
      # inputs.nixpkgs-unstable.follows = "nixpkgs";
    };

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ home-manager, neovim-nightly, nixpkgs, nixpkgs-unstable, nixpkgs-unstable-small, self, sops-nix, stylix, nixpkgs-stable, nix-darwin, ... }:
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
        # neorg-overlay.overlays.default
      ];

      overlays-mac = [
        neovim-nightly.overlays.default
        inputs.poetry2nix.overlays.default
        self.overlays-mac.default
        # neorg-overlay.overlays.default
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
        Adityas-MacBook-Pro = nix-darwin.lib.darwinSystem {
          modules = [
            ./system/darwin/configuration.nix

            { }
            home-manager.darwinModules.home-manager
            {
              nixpkgs.overlays = [
                (final: prev: {
                  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
                    (python-final: python-prev: {
                      a2a-sdk = python-prev.a2a-sdk.overridePythonAttrs (old: {
                        disabledTests = (old.disabledTests or [ ]) ++ [
                          "test_notification_triggering_with_in_message_config_e2e"
                          "test_notification_triggering_after_config_change_e2e"
                          "test_trace_function_sync_attribute_extractor_error_logged"
                        ];
                      });
                    })
                  ];
                })
              ];
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs pkgs-unstable-mac pkgs-stable-mac;
                system = "aarch64-darwin";
              };
              home-manager.users.adgai = import ./hosts/mac/home.nix;
            }
          ];
        };
      };
    };
}
