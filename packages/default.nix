inputs:

{
 neovim = inputs.self.nixosConfigurations.legion.config.home-manager.users.adgai.programs.neovim.finalPackage.override { wrapRc = true; };
}
