{ config, pkgs, lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./hyperland.nix
    ./i3.nix
    ./kubernetes.nix
    ./programs.nix
    ./qmk.nix
    ./rofi.nix
    ./wezterm.nix

    # ./customPkgs/python/bumblebee-status
    ./customPkgs/shell-scripts
  ];

  services.dunst.enable = true;
}
