{ pkgs, lib, config, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
  inherit (lib) mkEnableOption mkIf;
  inherit (config.programs.adgai.ui.rofi) enable;
in
{
  options.programs.adgai.ui.rofi.enable = mkEnableOption "rofi";
  config = mkIf enable {

    programs.rofi = {
      # package = pkgs.rofi-wayland;
      extraConfig = {
        modi = "run,drun,ssh,combi";
      };
      inherit enable;
    };
  };
}
