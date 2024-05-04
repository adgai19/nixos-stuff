{ config, pkgs, lib, inputs, ... }:
{
  imports = [ ./modules ../../users/common ];

  home.username = "adgai";
  home.homeDirectory = "/home/adgai";
  stylix.image  = ./background.png;

  programs.adgai = {
    kubernetes.enable = true;
    ui.rofi.enable = true;
    cli = {
      gh.enable = false;
      git.enable = true;
      direnv.enable = true;
      lf.enable = true;
      tmux.enable = true;
      shellconfig.enable = true;
    };
  };

}
