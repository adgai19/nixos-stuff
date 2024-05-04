{ pkgs, lib, config, ... }:
let inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
  };
}
