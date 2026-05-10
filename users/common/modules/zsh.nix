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
        c = "code-insiders .";
        ta = "tmux a";
        k = "kubectl";
        vi = "nvim";
        vim = "nvim";
        ki = "kubectl --kubeconfig=$HOME/.kube/clusters/kind.config";
        base64d = "base64 --decode | pbcopy";
        agedec="age -d -i  ~/.age/identities/identities.txt";
        ageenc="age -r age1yubikey1q2xqk42vclfcvuwwcslu2z2jsk6mkd5kf6l2ms8cfgmcfpjc3lrfj24zj7x -r age1yubikey1q22t4dl57x24eqqvnja6um5uc5qe7fgf07s2xtg2g6a8lcs3l7jh6w3uy0d -r age1se1qdlg2e3pgsu2dnw247qezznhqapat65sp5cy0h997qtvlu8zhkfy5k6u2aj -o";
        getsec="openssl rand -base64 24 | tr -dc 'A-Za-z0-9' | head -c 24 | pbcopy";
	miUp="migrate -database $DB_URL -path database/migrations -verbose up";
	mic="migrate create -ext sql -dir database/migrations -seq";
        claude = "~/.local/bin/claude";

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
      initContent = ''

        fpath+=("$HOME/.zsh/completions")
        zmodload zsh/zprof
        any-nix-shell zsh --info-right | source /dev/stdin

        setopt INC_APPEND_HISTORY
        setopt HIST_IGNORE_DUPS
        setopt HIST_FIND_NO_DUPS
        setopt HIST_IGNORE_SPACE
        setopt HIST_SAVE_NO_DUPS
        unsetopt HIST_VERIFY
        export DIRENV_LOG_FORMAT=""
        # bindkey "^P" up-line-or-search
        # bindkey "^N" down-line-or-search
        bindkey -s "^o" "tmux-sessionizer^M"
        # PATH='$PATH:/Users/adgai/.local/bin'

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

      __conda_setup="$('/Users/adgai/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__conda_setup"
      else
          if [ -f "/Users/adgai/miniconda3/etc/profile.d/conda.sh" ]; then
              . "/Users/adgai/miniconda3/etc/profile.d/conda.sh"
          else
              export PATH="/Users/adgai/miniconda3/bin:$PATH"
          fi
      fi
      unset __conda_setup
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
      icons = "auto";
    };

    programs.bat = {
      enable = true;
      # extraPackages = with pkgs.bat-extras; [   batman batgrep batdiff ];
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
