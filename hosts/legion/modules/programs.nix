{ pkgs, lib, inputs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    awscli2
    age
    age-plugin-yubikey
    ansible-lint
    arandr
    bashmount
    bottom
    cachix
    commitizen
    dbeaver
    diff-so-fancy
    discord-canary
    doppler
    evince
    # eww-wayland
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
    # poetry
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
    unzip
    vial
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

    jetbrains.idea-community
    maven
  ]) ++ (with pkgs-unstable; [
    (bumblebee-status.override { plugins = p: [ p.cpu p.system p.speedtest p.nic ]; })
  ]) ++ (with pkgs.customPkgs;[ ageEnc ageDec ageFile battery sesh ]);
  programs.go.enable = true;
  programs.go.package = pkgs-unstable.go_1_21;
}
