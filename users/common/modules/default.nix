{ config, pkgs, lib, ... }:
let
  list = builtins.filter (p: !(pkgs.lib.hasPrefix "default.nix" p)) (builtins.filter (p: pkgs.lib.hasSuffix ".nix" p) (builtins.attrNames (builtins.readDir ./users/common/modules)));
in
{

  imports = [
    ./direnv.nix
    ./gh.nix
    ./lf.nix
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];


  # imports = pkgs.lib.lists.forEach list (p: ./. + ("/" + p));
}
