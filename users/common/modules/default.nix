{ ... }: {

  imports = [

    ./direnv.nix
    ./lf.nix
    ./neovim.nix
    ./tmux.nix
    ./starship.nix
    ./zsh.nix
  ];
  programs.nnn.enable = false;


} 
