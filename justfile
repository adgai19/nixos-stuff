update hostname:
  nix flake update
  git add flake.lock
  just {{hostname}}
  git commit -m "build(flake.lock): update dep"

legion:
  sudo nixos-rebuild switch --flake .#legion --impure
  rm -rf result

old:
  sudo nixos-rebuild switch --flake .#old --impure
  rm -rf result
legion-test:
  sudo nixos-rebuild build --flake .#legion --impure
  rm -rf result

ubuntu-vm: 
  home-manager switch --flake .#ubuntu-vm
  rm -rf result

neovim:
  nix run .#neovim

legion-push:
  cachix watch-exec adgai19 -- sudo nixos-rebuild switch --flake .#legion --impure
  rm -rf result

ubuntu-vm-push: 
  cachix watch-exec adgai19 -- home-manager build --flake .#ubuntu-vm
  rm -rf result

statix:
  statix check .

nixfmt:
  fd --extension nix -x nixpkgs-fmt

stylua:
  fd --extension lua -x stylua

fix: && statix nixfmt stylua
  echo "getting ready to push"
neovim-push:
  cachix watch-exec adgai19 -- nix run .#neovim

neovim-cachix:
  nix build --json .#neovim\
    | jq -r '.[].outputs | to_entries[].value' \
    | cachix push adgai19
