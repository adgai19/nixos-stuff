{ config, pkgs, lib, ... }:
{
  imports = [
    ./git.nix
    ./kubernetes.nix
    ./programs.nix
    ./qmk.nix
  ];

}
