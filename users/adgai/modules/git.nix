{...}: {

  programs.git = {
    enable = true;
    userEmail = "gaitondeaditya@gmail.com";
    userName = "Aditya Gaitonde";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
