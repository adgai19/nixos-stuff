{ config, pkgs, lib, inputs, ... }:
{
  imports = [ ./modules ../../users/common ];

  home.username = "adgai";
  home.homeDirectory = "/home/adgai";

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
