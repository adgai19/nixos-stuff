{ config, lib, ... }:
let
  cfg = config.programs.adgai.cli.gh;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.programs.adgai.cli.gh = {
    enable = mkEnableOption "github cli";
  };
  config = mkIf cfg.enable {
    programs.gh = {
      enable = cfg.enable;
      settings = {
        editor = "nvim";
        git_protocol = "ssh";
        alias = {
          co = "pr checkout";
        };
      };
    };
  };


}
