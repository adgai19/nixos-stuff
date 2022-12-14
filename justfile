legion:
  sudo nixos-rebuild switch --flake .#legion --impure 
  rm -rf result

ubuntu-vm: 
  home-manager switch --flake .#ubuntu-vm
  rm -rf result

update:
  nix flake update
  git add flake.lock
  just $(hostname)
  git commit -m "update dep"

format:
  fd --extension nix -x nixpkgs-fmt

stylua:
  fd --extension lua -x stylua

neovim:
  nix run .#neovim
