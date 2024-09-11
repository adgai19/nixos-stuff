{ pkgs, lib, inputs, pkgs-unstable, pkgs-stable, ... }:
{
  home.packages = (with pkgs; [
    # eww-wayland
    # poetry
    age
    age-plugin-yubikey
    alacritty
    ansible-lint
    gitkraken
    arandr
    awscli2
    bashmount
    bottom
    broot
    cachix
    commitizen
    diff-so-fancy
    discord-canary
    # doppler
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
    pgcli
    pre-commit
    progress
    pulseaudio
    ripgrep
    scrot
    sesh
    statix
    stylua
    talosctl
    traceroute
    transmission_4-gtk
    tree
    unzip
    vault
    vial
    xclip
    xsettingsd
    yazi
    # kicad
    # yubikey-manager

    nodePackages.aws-cdk

    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server


    xfce.thunar

    calicoctl
    kind
    kubectl
    kubernetes-helm
    kubeswitch

    jetbrains.datagrip
    # jetbrains.rust-rover
    # jetbrains.idea-community
    maven
  ]) ++
  [
    (pkgs-stable.bumblebee-status.override { plugins = p: [ p.cpu p.system p.speedtest p.nic ]; })
  ]
  ++ (with pkgs.customPkgs;[ ageEnc ageDec ageFile battery ]);
  # programs.go.enable = true;
  # programs.go.package = pkgs-unstable.go_1_21;
}
