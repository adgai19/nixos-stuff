{ config, pkgs, lib, ... }:
{
  imports = [
    ./git.nix
    ./kubernetes.nix
    ./programs.nix
    ./qmk.nix
    # ./customPkgs/python/bumblebee-status
    # ./customPkgs/shell-scripts
  ];

}
