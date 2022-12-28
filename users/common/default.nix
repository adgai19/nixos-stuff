{ config, pkgs, lib, inputs, ... }:
let

  overlays = [
    inputs.neovim-nightly.overlay
    inputs.poetry2nix.overlay
    inputs.firefox-overlay.overlay
    (import ./overlays.nix inputs)
  ];
in
{
  nixpkgs.overlays = overlays;

  imports = [ ./modules ];
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
  };
}
