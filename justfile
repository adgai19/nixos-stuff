legion:
  cachix watch-exec adgai19 -- sudo nixos-rebuild switch --flake .#legion --impure
  rm -rf result

ubuntu-vm: 
  cachix watch-exec adgai19 -- home-manager switch --flake .#ubuntu-vm
  rm -rf result

update:
  nix flake update
  git add flake.lock
  just $(hostname)
  git commit -m "update dep"

nixfmt:
  fd --extension nix -x nixpkgs-fmt

stylua:
  fd --extension lua -x stylua

neovim:
  cachix watch-exec adgai19 -- nix run .#neovim

neovim-cachix:
  nix build --json .#neovim\
    | jq -r '.[].outputs | to_entries[].value' \
    | cachix push adgai19
