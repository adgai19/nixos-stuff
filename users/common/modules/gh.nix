{ config, lib, ... }:
let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.programs.adgai.cli.gh) enable;
in
{
  options.programs.adgai.cli.gh = {
    enable = mkEnableOption "github cli";
  };
  config = mkIf enable {
    programs.gh = {
      inherit enable;
      #      settings = {
      #       editor = "nvim";
      #       git_protocol = "ssh";
      #       alias = {
      #         co = "pr checkout";
      #       };
      #    };
    };
  };


}
