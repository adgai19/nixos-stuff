{ config, pkgs, lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./i3.nix
    ./kitty.nix
    ./lf.nix
    ./neovim.nix
    ./polybar.nix
    ./programs.nix
    ./qmk.nix
    ./rofi.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix

    ./customPkgs/python/bumblebee-status
    ./customPkgs/shell-scripts
  ];

  services.dunst.enable = true;
}
