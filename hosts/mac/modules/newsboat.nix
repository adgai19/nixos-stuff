{ pkgs }: {
  home.packages = with pkgs; [
    ueberzug
    pup
    xclip
    wget
    youtube-dl
    curl
    w3m
  ];
  programs.newsboat = {
    enable = true;
  };
}
