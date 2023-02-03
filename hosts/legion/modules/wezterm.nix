{ pkgs, ... }: {
  programs.wezterm.enable = true;
  programs.kitty.enable = true;
  programs.wezterm.extraConfig = ''
    local wezterm = require 'wezterm'
    return {
      color_scheme = "TokyoNight (Gogh)",
      enable_wayland = false;
      window_background_opacity = 0.85,
      font = wezterm.font('Fira Code'),
      enable_tab_bar = false,
      font_size = 9,
      keys = {
        {
          key = 'n',
          mods = 'SHIFT|CTRL',
          action = wezterm.action.ToggleFullScreen,
        },
      },
    }
  '';
}
