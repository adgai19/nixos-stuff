{ pkgs, lib, inputs, pkgs-unstable, pkgs-stable, ... }:
{
  home.packages = (with pkgs; [
    # eww-wayland
    # poetry
    age
    age-plugin-yubikey
    # alacritty
    ansible-lint
    gitkraken
    arandr
    awscli2
    # bashmount
    bottom
    broot
    cachix
    commitizen
    diff-so-fancy
    discord-canary
    fd
    feh
    gcc
    gh
    ghc
    htop
    hyp
    jq
    just
    lazydocker
    lazygit
    newsboat
    nixpkgs-fmt
    pgcli
    pre-commit
    ripgrep
    sesh
    statix
    stylua
    sops
    tree
    unzip
    yazi
    zed-editor

    nodePackages.aws-cdk

    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server

    android-tools

    kind
    kubectl
    kubernetes-helm
    kubeswitch

    jetbrains.datagrip
    jetbrains.rust-rover
    # jetbrains.idea-community
  ]);
  # ++ (with pkgs.customPkgs;[ ageEnc ageDec ageFile battery json2struct ])
  # programs.go.enable = true;
  # programs.go.package = pkgs-unstable.go_1_21;
}
