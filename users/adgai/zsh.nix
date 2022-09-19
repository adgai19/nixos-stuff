{ ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "exa";
      la = "exa -la";
      l = "exa -l";
      cat = "bat";
      pg = "ping google.com";
      gs = "git status";
    };
    initExtra = ''
      eval "$(starship init zsh)"
      export I3SOCK = $(i3 --get-socket)
      xmodmap -e "keycode 108 = Alt_R"
    '';
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.exa = {
    enable = true;
  };
}

