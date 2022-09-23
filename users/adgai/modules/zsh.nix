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
    };
    defaultKeymap = "viins";
    initExtra = ''
      eval "$(starship init zsh)"
      I3SOCK=$(i3 --get-socket)
      xmodmap -e "keycode 108 = Alt_R"
      bindkey "^P" up-line-or-search
      bindkey "^N" down-line-or-search
      bindkey -s "^o" "tmux-sessionizer^M"
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

