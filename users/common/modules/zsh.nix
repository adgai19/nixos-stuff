{ ... }:
{
  programs.zsh = {
    enable = true;
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
            eval "$(starship init zsh)"
            export DIRENV_LOG_FORMAT=
            I3SOCK=$(i3 --get-socket)
            xmodmap -e "keycode 108 = Alt_R"
            bindkey "^P" up-line-or-search
            bindkey "^N" down-line-or-search
            bindkey -s "^o" "tmux-sessionizer^M"


           f () {
             tmp="$(mktemp)"

      cleanup() {
          exec 3>&-
      rm "$FIFO_UEBERZUG"
      }

      if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
      lf "$@"
      else
      [ ! -d "$HOME/.cache/lf" ] && mkdir --parents "$HOME/.cache/lf"
      export FIFO_UEBERZUG="$HOME/.cache/lf/ueberzug-$$"
      mkfifo "$FIFO_UEBERZUG"
      ueberzug layer -s <"$FIFO_UEBERZUG" -p json &
      exec 3>"$FIFO_UEBERZUG"
      trap cleanup EXIT
      lf -last-dir-path="$tmp" "$@" 3>&-
             if [ -f "$tmp" ]; then
                 dir="$(cat "$tmp")"
                 rm -f "$tmp"
                 if [ -d "$dir" ]; then
                     if [ "$dir" != "$(pwd)" ]; then
                         cd "$dir"
                     fi
                 fi
             fi

      fi
           }

            bindkey -s "^F" "f^M"
    '';

    enableAutosuggestions = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.exa = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };
}


