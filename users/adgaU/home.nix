{ config, pkgs, lib, inputs, ... }:
{
  imports = [ ../common ];
  home = {
    username = "adgai";
    homeDirectory = "/home/adgai";
    stateVersion = "22.05";
  };


  programs.git = {
    enable = true;
    userEmail = "gaitondeaditya@gmail.com";
    userName = "Aditya Gaitonde";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
  programs.home-manager.enable = true;
  programs.exa.enable = true;
  programs.bat.enable = true;
}
