#!/bin/sh
nixos-rebuild build --flake .#adgai
sudo nixos-rebuild switch --flake .#adgai

