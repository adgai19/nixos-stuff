{ pkgs, lib, inputs, ... }:
{
  home.packages = with pkgs; [
    # hyperbeam
    age
    age-plugin-yubikey
    arandr
    awscli2
    bottom
    brave
    cachix
    discord
    eww-wayland
    evince
    fd
    feh
    filezilla
    firefox-devedition-bin
    flameshot
    gcc
    gh
    ghc
    htop
    hyp
    iw
    jq
    just
    lazydocker
    lazygit
    librewolf
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
    # wofi
    xclip
    xsettingsd
    yubikey-manager

    # python310
    # python310Packages.adblock
    # python310Packages.netifaces
    # python310Packages.tkinter

    nodePackages.aws-cdk

    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
  ];
}
