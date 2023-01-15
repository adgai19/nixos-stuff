{ config, pkgs, lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./i3.nix
    ./kitty.nix
    ./programs.nix
    ./qmk.nix
    ./rofi.nix

    # ./customPkgs/python/bumblebee-status
    ./customPkgs/shell-scripts
  ];

  services.dunst.enable = true;
}
