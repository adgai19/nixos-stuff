{ config, pkgs, lib, ... }:
{
  imports = [
    ./direnv.nix
    ./gh.nix
    ./git.nix
    ./kubernetes.nix
    ./lf.nix
    ./neovim.nix
    ./programs.nix
    ./qmk.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
