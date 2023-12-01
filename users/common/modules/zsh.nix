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
        k3 = "kubectl --kubeconfig=$HOME/.kube/clusters/k3s.config";
        ki = "kubectl --kubeconfig=$HOME/.kube/clusters/kind.config";
      };
      defaultKeymap = "viins";
      initExtra = ''
        any-nix-shell zsh --info-right | source /dev/stdin
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
      enableAliases = true;
      icons = true;
    };

    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ prettybat batwatch batpipe batman batgrep batdiff ];
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
