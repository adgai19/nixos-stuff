{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = [
    git
    zsh
    nixpkgs-fmt
    just
  ];
}
