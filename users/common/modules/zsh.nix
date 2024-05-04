{ config, lib, pkgs, ... }:
let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.programs.adgai.cli.shellconfig) enable;
in
{
  options.programs.adgai.cli.shellconfig.enable = mkEnableOption "zsh";

  config = mkIf enable {
    programs.zsh = {
      inherit enable;
      shellGlobalAliases = {
        cat = "bat";
        pg = "ping google.com";
        gs = "git status";
        nb = "newsboat";
        j = "just --choose";
        c = "cz c";
        ta = "tmux a";
        k3 = "kubectl --kubeconfig=$HOME/.kube/clusters/k3s.config";
        ki = "kubectl --kubeconfig=$HOME/.kube/clusters/kind.config";
      };
      defaultKeymap = "emacs";
      history = {
        expireDuplicatesFirst = true;
        extended = true;
        ignoreAllDups = true;
        save = 500000;
        size = 500000;
      };
      syntaxHighlighting.enable = true;
      initExtra = ''
        zmodload zsh/zprof
        any-nix-shell zsh --info-right | source /dev/stdin

        setopt INC_APPEND_HISTORY
        setopt HIST_IGNORE_DUPS
        setopt HIST_FIND_NO_DUPS
        setopt HIST_IGNORE_SPACE
        setopt HIST_SAVE_NO_DUPS
        unsetopt HIST_VERIFY
        export DIRENV_LOG_FORMAT=
        # bindkey "^P" up-line-or-search
        # bindkey "^N" down-line-or-search
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

      autosuggestion.enable = true;
      enableCompletion = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };
    home.packages = [ pkgs.any-nix-shell ];

    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      icons = true;
    };

    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ prettybat batwatch batpipe batman batgrep batdiff ];
    };

    programs.zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
      enableZshIntegration = true;
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.atuin = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        auto_sync = true;
        sync_frequency = "5m";
        sync_address = "https://api.atuin.sh";
        search_mode = "fuzzy";
      };
    };
  };
}
