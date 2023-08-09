{ pkgs, lib, inputs, ... }:
{
  home.packages = with pkgs; [
    awscli2
    age
    # age-plugin-yubikey
    ansible-lint
    arandr
    bottom
    cachix
    commitizen
    diff-so-fancy
    discord
    evince
    # eww-wayland
    fd
    feh
    filezilla
    firefox-devedition-bin
    flameshot
    gcc
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
    pre-commit
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
    # yubikey-manager

    nodePackages.aws-cdk

    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server

    alacritty

    xfce.thunar

    kubernetes-helm
    calicoctl
    kubectl
    kubeswitch

    #jetbrains.idea-community
    maven
  ];
  programs.go.enable = true;
}
