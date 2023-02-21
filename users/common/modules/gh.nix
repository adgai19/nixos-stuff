{ config, lib, ... }:
let
  cfg = config.programs.adgai.gh;
  inherit (lib) mkOption mkIf types;
in
{
  options.programs.adgai.gh = {
    enable = mkOption {
      description = "gh module";
      type = types.bool;
      default = false;
    };
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
