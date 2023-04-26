{ config, pkgs, lib, inputs, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "adgai";
  home.homeDirectory = "/home/adgai";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # nixpkgs.overlays = [(import ./overlays.nix )];

  imports = [ ./modules ../../users/common ];

  programs.adgai.cli = {
    gh.enable = true;
    git.enable = true;
    direnv.enable = true;
    lf.enable = true;
    tmux.enable = true;
    shellconfig.enable = true;
  };
  programs.adgai.kubernetes.enable = true;
  programs.adgai.ui.rofi.enable = true;

}
