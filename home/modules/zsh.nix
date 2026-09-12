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
      syntaxHighlighting.enable = false;
      initContent = ''
        if [[ -x /opt/homebrew/bin/brew ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -x /usr/local/bin/brew ]]; then
          eval "$(/usr/local/bin/brew shellenv)"
        fi

        fpath+=("$HOME/.zsh/completions")
        _adgai_zle_tty() {
          [[ -o interactive && -t 0 && -t 1 && $TERM != dumb ]]
        }

        # resolve symlinks + drop missing dirs — collapses 3 identical Nix store
        # paths (1204 files each) into 1 and removes 7 phantom entries
        () {
          local -aU _fp
          local _d _r
          for _d in $fpath; do
            _r=$(cd "$_d" 2>/dev/null && pwd -P) && _fp+=($_r)
          done
          fpath=($_fp)
        }

        _adgai_after_prompt_init() {
          setopt local_options extended_glob

          add-zle-hook-widget -d zle-line-init _adgai_after_prompt_init

          source <(${pkgs.fzf}/bin/fzf --zsh)

          eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
          (( $+functions[_direnv_hook] )) && _direnv_hook

          eval "$(${pkgs.atuin}/bin/atuin init zsh)"

          if (( $+commands[any-nix-shell] )); then
            any-nix-shell zsh --info-right | source /dev/stdin
          fi

          source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
          ZSH_AUTOSUGGEST_STRATEGY=(history)

          if [[ -n ''${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
            compinit -u
            zcompile -R ''${ZDOTDIR:-$HOME}/.zcompdump &!
          else
            compinit -uC
          fi

          source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
          ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

          zle reset-prompt
        }

        if _adgai_zle_tty; then
          eval "$(${pkgs.zoxide}/bin/zoxide init zsh --cmd cd)"
          eval "$(${pkgs.starship}/bin/starship init zsh)"

          autoload -Uz compinit add-zle-hook-widget
          add-zle-hook-widget zle-line-init _adgai_after_prompt_init
        fi

        export DIRENV_LOG_FORMAT=""
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

   tgz() {
      emulate -L zsh
      setopt local_options err_return pipefail

      local verbose=""
      if [[ $1 == "-v" ]]; then
        verbose="v"
        shift
      fi

      if [[ $# -lt 2 ]]; then
        print -u2 "Usage: tgz [-v] <archive.tar.gz> <path> [more paths...]"
        return 1
      fi

      local archive=$1
      shift

      COPYFILE_DISABLE=1 tar "c''${verbose}zf" "$archive" \
        --exclude='.DS_Store' \
        --exclude='._*' \
        "$@"

      print "Created $archive ($(du -h "$archive" | cut -f1))"
    }

      '';

      autosuggestion.enable = false;
      enableCompletion = false;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = false;
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
      enableZshIntegration = false;
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = false;
    };
    programs.atuin = {
      enable = true;
      enableZshIntegration = false;
      settings = {
        auto_sync = true;
        sync_frequency = "5m";
        sync_address = "https://api.atuin.sh";
        search_mode = "fuzzy";
      };
    };
  };
}
