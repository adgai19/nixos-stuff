{ config, pkgs, ... }: {
  home.packages = with pkgs; [ i3 i3wsr ];
  home.file."i3wsr" = {
    source = ../config/i3wsr/config.toml;
    target = "/home/adgai/.config/i3wsr/config.toml";
  };

}
