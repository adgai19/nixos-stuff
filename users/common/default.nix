{ config, pkgs, lib, inputs, ... }: {


  imports = [ ./modules ];
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";

    WLR_NO_HARDWARE_CURSORS = 1;
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
  };
}
