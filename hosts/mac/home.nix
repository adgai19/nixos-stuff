{ config, pkgs, lib, inputs, ... }:
{
  imports = [ ./modules ../../users/common ];

  home.username = "adgai";
  home.stateVersion = "23.11";
  programs.adgai = {
  #   kubernetes.enable = true;
    cli = {
  #     gh.enable = false;
  #     git.enable = true;
      direnv.enable = true;
  #     lf.enable = true;
      tmux.enable = true;
      shellconfig.enable = true;
    };
  };

  # home.packages = [./modules/customPkgs/shell-scripts/ageDec.nix ./modules/customPkgs/shell-scripts/ageEnc.nix];

}
