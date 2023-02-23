{ pkgs, config, lib, ... }:
let
  cfg = config.programs.adgai.cli.direnv;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.programs.adgai.cli.direnv = {
    enable = mkEnableOption "direnv";
  };
  config = mkIf cfg.enable {
    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

  };

}
