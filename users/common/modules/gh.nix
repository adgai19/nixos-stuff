{ ... }: {
  programs.gh = {
    enable = true;
    settings = {
      editor = "nvim";
      git_protocol = "ssh";
      alias = {
        co = "pr checkout";
      };
    };
  };
}
