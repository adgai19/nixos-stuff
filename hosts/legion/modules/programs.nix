{ pkgs, lib, inputs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    # eww-wayland
    # poetry
    age
    age-plugin-yubikey
    alacritty
    ansible-lint
    arandr
    awscli2
    bashmount
    bottom
    cachix
    commitizen
    dbeaver
    diff-so-fancy
    discord-canary
    doppler
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


    xfce.thunar

    calicoctl
    kind
    kubectl
    kubernetes-helm
    kubeswitch

    jetbrains.datagrip
    jetbrains.idea-community
    maven
  ]) ++ (with pkgs-unstable; [
    (bumblebee-status.override { plugins = p: [ p.cpu p.system p.speedtest p.nic ]; })
  ]) ++ (with pkgs.customPkgs;[ ageEnc ageDec ageFile battery sesh ]);
  # programs.go.enable = true;
  # programs.go.package = pkgs-unstable.go_1_21;
}
