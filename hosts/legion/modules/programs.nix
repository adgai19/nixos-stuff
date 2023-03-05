{ pkgs, lib, inputs, ... }:
{
  home.packages = with pkgs; [
    # hyperbeam
    # wofi

    age
    age-plugin-yubikey
    arandr
    # awscli2
    bottom
    # brave
    cachix
    diff-so-fancy
    discord
    evince
    eww-wayland
    fd
    feh
    filezilla
    firefox-devedition-bin
    flameshot
    gcc
    # gh
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
    progress
    pulseaudio
    ripgrep
    scrot
    statix
    stylua
    traceroute
    transmission-gtk
    tree
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
