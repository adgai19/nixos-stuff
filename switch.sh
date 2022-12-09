#!/bin/sh
#
set -o errexit
#nixos-rebuild build --flake .#adgai --impure
sudo nixos-rebuild switch --flake .#legion 


