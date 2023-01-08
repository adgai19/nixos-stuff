nixos:
  sudo nixos-rebuild switch --flake .#legion --impure 

ubuntu-vm: 
  home-manager switch --flake .#ubuntu-vm

update:
  nix flake update
  git add flake.lock
  just $(hostname)
  git commit -m "update dep"

format:
  fd --extension nix -x nixpkgs-fmt

stylua:
  fd --extension lua -x stylua

