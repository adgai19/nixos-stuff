{ pkgs, lib, inputs, ... }:
{
  home.packages = with pkgs; [

    age
    age-plugin-yubikey
    # ansible-lint
    # yq
    # arandr
    awscli2
    bottom
    # broot
    # cachix
    commitizen
    caddy
    diff-so-fancy
    # discord-canary
    fd
    # feh
    gcc
    gh
    # ghc
    # gitkraken
    # go-migrate
    htop
    # hyp
    jq
    just
    lazydocker
    lazygit
    # newsboat
    nixpkgs-fmt
    # nodejs_23
    pgcli
    pre-commit
    ripgrep
    sesh
    # sops
# litellm
    statix
    stylua
    tree
    unixtools.ping
    unzip
    uv
    yazi
    # zed-editor

    # nodePackages.aws-cdk
    #
    # nodePackages_latest.typescript
    # nodePackages_latest.typescript-language-server

    android-tools

    # kind
    kubectl
    # kubernetes-helm
    kubeswitch

    # jetbrains.rust-rover
  ];
}
