{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    # hyperbeam
    arandr
    bottom
    brave
    cachix
    discord
    evince
    fd
    feh
    filezilla
    firefox-devedition-bin
    flameshot
    gcc
    gh
    htop
    hyp
    iw
    lazydocker
    lazygit
    newsboat
    nixpkgs-fmt
    nodejs-18_x
    pavucontrol
    poetry
    pulseaudio
    python310
    python310Packages.adblock
    python310Packages.netifaces
    python310Packages.tkinter
    ripgrep
    scrot
    stylua
    tree
    xclip
    xsettingsd

  ];
}
