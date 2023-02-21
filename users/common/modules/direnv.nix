{ pkgs, config, lib, ... }:
let
  cfg = config.programs.adgai.direnv;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.programs.adgai.direnv = {
    enable = mkEnableOption "direnv";
  };
  config = mkIf cfg.enable {
    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;
    # optional for nix flakes support in home-manager 21.11, not required in home-manager unstable or 22.05

  };

}
