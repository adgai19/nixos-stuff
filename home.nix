{ config, pkgs, lib, inputs, ... }:
{
  imports = [ ./home/modules ];

  home.username = "adgai";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  programs.adgai.cli = {
    direnv.enable = true;
    tmux.enable = true;
    shellconfig.enable = true;
  };

  home.file."ghostty" = {
    source = ./home/config/ghostty/config;
    target = ".config/ghostty/config";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
  };
}
