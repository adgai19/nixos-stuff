{ pkgs, ... }: {
  # programs.hyperland = {
  #   enable = true;
  #   nvidiaPatches = true;
  # };
  home.packages = with pkgs; [
    rofi-wayland
    wallutils
    waybar
  ];
}
