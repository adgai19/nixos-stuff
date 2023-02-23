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
  # Let Home Manager install and manage itself.

  programs.adgai.cli.gh.enable = true;
  programs.adgai.cli.direnv.enable = true;
  programs.adgai.cli.lf.enable = true;
  programs.adgai.cli.tmux.enable = true;
  programs.adgai.cli.shellconfig.enable = true;

}
