{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = [
    git
    just
    nixpkgs-fmt
    statix
    zsh
  ];
}
