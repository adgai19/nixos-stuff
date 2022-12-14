{ pkgs, lib, inputs, ... }:
{
  home.packages = with pkgs; [
    # hyperbeam
    age
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
    jq
    just
    lazydocker
    lazygit
    newsboat
    nixpkgs-fmt
    nodejs-18_x
    pavucontrol
    poetry
    pulseaudio
    ripgrep
    scrot
    stylua
    transmission-gtk
    tree
    xclip
    xsettingsd
    yubikey-manager

    python310
    python310Packages.adblock
    python310Packages.netifaces
    python310Packages.tkinter

    nodePackages.aws-cdk

    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
  ];
}
