{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    poetry
    firefox-devedition-bin
    gcc
    discord
    htop
    lazydocker
    nixpkgs-fmt
    flameshot
    rnix-lsp
    xclip
    hyp
    # hyperbeam
    lazygit
    nodejs-18_x
    gopls
    stylua
    iw
    pulseaudio
    gh
    xsettingsd
    python310
    scrot
    feh
    filezilla
    python310Packages.netifaces
    python310Packages.tkinter
    python310Packages.jedi-language-server
    nodePackages."@prisma/language-server"
    nodePackages."bash-language-server"
    nodePackages."dockerfile-language-server-nodejs"
    nodePackages."graphql-language-service-cli"
    nodePackages."pyright"
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    nodePackages."vscode-langservers-extracted"
    nodePackages."yaml-language-server"
    rust-analyzer
    sumneko-lua-language-server
    terraform-ls

  ];
}
