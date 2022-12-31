nixos:
  sudo nixos-rebuild switch --flake .#legion --impure

ubuntu-vm: 
  home-manager switch --flake .#ubuntu-vm

update:
  nix flake update
