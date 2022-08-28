{...}:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "exa";
      la = "exa -la";
      l = "exa -l";
    };
    initExtra = ''
      eval "$(starship init zsh)"
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

