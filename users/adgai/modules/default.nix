{ config, pkgs, lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./i3.nix
    ./kitty.nix
    ./neovim.nix
    ./programs.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
    ./customPkgs/python/bumblebee-status
    ./customPkgs/shell-scripts
    ./rofi.nix
    ./qmk.nix
  ];
}










