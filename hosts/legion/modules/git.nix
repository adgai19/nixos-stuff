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
        lgf = "log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' --all";
        slog = "log --graph --all --topo-order --pretty='format:%h %ai %s%d (%an)'";
      };
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        push = {
          autoSetupRemote = true;
        };
        pull = {
          rebase = true;
        };
      };
    };
  };
}
