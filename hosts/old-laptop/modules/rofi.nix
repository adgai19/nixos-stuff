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
      package = pkgs.rofi-wayland;
      extraConfig = {
        modi = "run,drun,ssh,combi";
      };
      inherit enable;
      theme = {
        "*" = {
          bg0 = mkLiteral "#24283b";
          bg1 = mkLiteral "#1f2335";
          fg0 = mkLiteral "#c0caf5";
          fg1 = mkLiteral "#a9b1d6";
          background-color = mkLiteral "#24283b";
          text-color = mkLiteral "#c0caf5";
        };
        "element-icon, element-text, scrollbar" = {
          cursor = mkLiteral "pointer";
        };

        "window" = {
          border = mkLiteral "0.1px";
          border-color = mkLiteral "@bg1";
          border-radius = mkLiteral "6px";
        };
        "inputbar" = {
          spacing = mkLiteral "8px";
          padding = mkLiteral "4px 8px";
          children = mkLiteral "[ icon-search, entry ]";

          #background-color = mkLiteral "@bg0";
          background-color = mkLiteral "@bg0";
        };

        "icon-search, entry, element-icon, element-text" = {
          vertical-align = mkLiteral "0.5";
        };

        "icon-search" = {
          expand = false;
          filename = mkLiteral "[ search-symbolic ]";
          size = mkLiteral "14px";
        };

        "textbox" = {
          padding = mkLiteral "4px 8px";
          background-color = mkLiteral "@bg0";
        };

        "listview" = {
          padding = mkLiteral "4px 0px";
          lines = 12;
          columns = 1;
          scrollbar = true;
          fixed-height = false;
          dynamic = true;
        };

        "element" = {
          padding = mkLiteral "4px 8px";
          spacing = mkLiteral "8px";
        };

        "element normal urgent" = {
          text-color = mkLiteral "@fg1";
        };

        "element normal active" = {
          text-color = mkLiteral "@fg1";
        };

        "element selected" = {
          text-color = mkLiteral "@bg0"; #1
          background-color = mkLiteral "@fg1";
        };

        "element selected urgent" = {
          background-color = mkLiteral "@fg1";
        };

        "element-icon" = {
          size = mkLiteral "0.8em";
        };

        "element-text" = {
          text-color = mkLiteral "#a9b1d6";
        };

        "scrollbar" = {
          handle-width = mkLiteral "4px";
          handle-color = mkLiteral "@fg1";
          padding = mkLiteral "0 4px";
        };
      };
    };
  };
}
