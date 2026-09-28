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

    home-manager = {
      url = "github:nix-community/home-manager";
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

  outputs = inputs@{ home-manager, neovim-nightly, nixpkgs, nixpkgs-unstable, self, nix-darwin, ... }:
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
            ./darwin.nix

            { }
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs pkgs-unstable-mac;
                system = macSystem;
              };
              home-manager.users.adgai = import ./home.nix;
            }
          ];
        };
      };
    };
}
