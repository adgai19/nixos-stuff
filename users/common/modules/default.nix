{ config, ... }:
{

  imports = [
    ./direnv.nix
    ./gh.nix
    ./lf.nix
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];

} 
