#!/bin/sh
set -o errexit
nixos-rebuild build --flake .#adgai
sudo nixos-rebuild switch --flake .#adgai

