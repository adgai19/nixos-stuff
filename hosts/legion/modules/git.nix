{ body, lib, config, ... }:
let
  inherit (lib) mkEnableOption mkIf mkOption;
  inherit (config.programs.adgai.cli.git) enable userEmail;
in
{
  options.programs.adgai.cli.git = {
    enable = mkEnableOption "git";
    userEmail = mkOption {
      type = lib.types.str;
      default = "gaitondeaditya@gmail.com";
    };
  };

  config = mkIf enable {

    programs.git = {
      inherit enable userEmail;
      userName = "Aditya Gaitonde";
      diff-so-fancy = {
        enable = true;
      };
      aliases = {
        ds = "diff --staged";
        ap = "add -p";
      };
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        pull = {
          rebase = true;
        };
      };
    };
  };
}
