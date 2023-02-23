{ config, lib, ... }:
let
  cfg = config.programs.adgai.cli.shellconfig;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.programs.adgai.cli.shellconfig.enable = mkEnableOption "zsh";

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = cfg.enable;
      shellGlobalAliases = {
        ls = "exa";
        la = "exa -la";
        l = "exa -l";
        cat = "bat";
        pg = "ping google.com";
        gs = "git status";
        nb = "newsboat";
        j = "just --choose";
      };
      defaultKeymap = "viins";
      initExtra = ''
        export DIRENV_LOG_FORMAT=
        bindkey "^P" up-line-or-search
        bindkey "^N" down-line-or-search
        bindkey -s "^o" "tmux-sessionizer^M"

        lfcd() {
        	tmp="$(mktemp)"
        	command lf -last-dir-path="$tmp" "$@"
        	if [ -f "$tmp" ]; then
        		dir="$(cat "$tmp")"
        		rm -f "$tmp"
        		if [ -d "$dir" ]; then
        			if [ "$dir" != "$(pwd)" ]; then
        				cd "$dir"
        			fi
        		fi
        	fi
        }
        bindkey -s "^F" "lfcd^M"
      '';

      enableAutosuggestions = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };

    programs.exa = {
      enable = true;
    };

    programs.bat = {
      enable = true;
    };

    programs.zoxide = {
      enable = true;
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
