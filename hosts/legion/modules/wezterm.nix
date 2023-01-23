{ pkgs, ... }: {
  programs.wezterm.enable = true;
  programs.wezterm.extraConfig = ''
    local wezterm = require 'wezterm'
    return {
      color_scheme = "TokyoNight (Gogh)",
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