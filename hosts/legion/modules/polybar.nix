{ pkgs, ... }: {
  # programs.i3status-rust={
  #   enable = true;
  #
  # };
  services.polybar = {
    enable = true;
    script = "polybar two -r &";
  };
}
