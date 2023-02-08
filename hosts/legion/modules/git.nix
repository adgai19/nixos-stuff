{ body, ... }: {

  programs.git = {
    enable = true;
    userEmail = "gaitondeaditya@gmail.com";
    userName = "Aditya Gaitonde";
    diff-so-fancy ={
      enable = true;
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;

      };
    };
  };
}
