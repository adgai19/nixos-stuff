{ config, pkgs, lib, inputs, ... }: {


  imports = [ ./modules ];
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
  };
}
