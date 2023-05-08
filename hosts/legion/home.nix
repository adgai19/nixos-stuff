{ config, pkgs, lib, inputs, ... }:
{
  imports = [ ./modules ../../users/common ];

  home.username = "adgai";
  home.homeDirectory = "/home/adgai";

  programs.adgai.cli = {
    gh.enable = true;
    git.enable = true;
    direnv.enable = true;
    lf.enable = true;
    tmux.enable = true;
    shellconfig.enable = true;
  };
  programs.adgai.kubernetes.enable = true;
  programs.adgai.ui.rofi.enable = true;

}
