inputs: pkgs:

{
  neovim = inputs.self.nixosConfigurations.legion.config.home-manager.users.adgai.programs.neovim.finalPackage.override { wrapRc = true; };
  ageEnc = pkgs.callPackage ../hosts/legion/modules/customPkgs/shell-scripts/ageEnc.nix { };
  ageDec = pkgs.callPackage ../hosts/legion/modules/customPkgs/shell-scripts/ageDec.nix { };
  ageFile = pkgs.callPackage ../hosts/legion/modules/customPkgs/shell-scripts/ageFile.nix { };
  battery = pkgs.callPackage ../hosts/legion/modules/customPkgs/python/corne-battery/battery.nix { };
  sesh = pkgs.buildGoModule {
    name = "sesh";
    vendorHash = "sha256-zt1/gE4bVj+3yr9n0kT2FMYMEmiooy3k1lQ77rN6sTk=";
    src = inputs.sesh-tmux;
  };
}
