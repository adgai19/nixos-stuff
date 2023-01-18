{ ... }: {

  imports = [
    ./direnv.nix
    ./gh.nix
    ./lf.nix
    ./neovim.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
  ];
  programs.nnn.enable = false;


} 
