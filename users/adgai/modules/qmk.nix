{pkgs,...}: {
  home.packages = with pkgs; [qmk via];
}
