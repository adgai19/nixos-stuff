{ pkgs, lib,  ... }:
let
  sources = ../../nix/sources.nix;
in
{
  home.packages = with pkgs; [
 poetry
    gcc
    discord
    htop
    lazydocker
    nixpkgs-fmt
    rnix-lsp
    xclip
    lazygit
    nodejs-18_x
    gopls
    stylua
    python310
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
