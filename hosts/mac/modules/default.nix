{ config, pkgs, lib, ... }:
{
  imports = [
    ./git.nix
    ./kubernetes.nix
    ./programs.nix
    ./qmk.nix
    ./wezterm.nix
    # ./customPkgs/python/bumblebee-status
    # ./customPkgs/shell-scripts
  ];

}
