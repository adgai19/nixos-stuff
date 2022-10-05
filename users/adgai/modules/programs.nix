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
    xclip
    hyp
    # hyperbeam
    lazygit
    nodejs-18_x
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
    brave
    python310Packages.adblock
    python310Packages.tkinter

  ];
}
