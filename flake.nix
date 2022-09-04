{
  description = "My nix config";

  inputs = {
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
    system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config = { allowUnfree = true; };
  };
  overlays = [inputs.neovim.nightly.overlay];

  in {
    nixosConfigurations = {
      adgai = nixpkgs.lib.nixosSystem {
	inherit system;
	modules = [
	  ./system/configuration.nix
	    home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users.adgai = import ./users/adgai/home.nix;
	    }
	];
      };
    };
  };
}
