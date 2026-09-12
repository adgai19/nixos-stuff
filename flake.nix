{

  description = "Aditya's nix-darwin + home-manager config";

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

  outputs = inputs@{ home-manager, neovim-nightly, nixpkgs, nixpkgs-unstable, nixpkgs-unstable-small, self, nixpkgs-stable, nix-darwin, ... }:
    let
      macSystem = "aarch64-darwin";

      pkgs-mac = import nixpkgs {
        system = macSystem;
        config = { allowUnfree = true; };
      };
      pkgs-unstable-mac = import nixpkgs-unstable {
        system = macSystem;
        config = { allowUnfree = true; };
      };

      pkgs-stable-mac = import nixpkgs-stable {
        system = macSystem;
        config = { allowUnfree = true; };
      };

      pkgs-unstable-small-mac = import nixpkgs-unstable-small {
        system = macSystem;
        config = { allowUnfree = true; };
      };

    in
    {

      devShells."${macSystem}".default = pkgs-mac.mkShellNoCC {
        packages = with pkgs-mac; [ git zsh nixpkgs-fmt just ];
        shellHook = ''echo Inside nix dev shell'';
      };

      nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

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
                system = macSystem;
              };
              home-manager.users.adgai = import ./hosts/mac/home.nix;
            }
          ];
        };
      };
    };
}
