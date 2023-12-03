{ pkgs, inputs, system, ... }:
{
  programs.wezterm.enable = true;
  programs.kitty.enable = true;

  # set_environment_variables = {
  #   TERMINFO_DIRS = '/home/user/.nix-profile/share/terminfo',
  # },
  programs.wezterm.extraConfig = ''
    local wezterm = require("wezterm")
    local config = {
    }

    if wezterm.config_builder then
    	config = wezterm.config_builder()
    end

    	config.force_reverse_video_cursor = true

    	config.term = "wezterm"
    	config.enable_wayland = false
    	config.font = wezterm.font("Maple Mono")
    	config.enable_tab_bar = false
    	config.font_size = 9
    	config.keys = {
    		{
    			key = "n",
    			mods = "SHIFT|CTRL",
    			action = wezterm.action.ToggleFullScreen,
    		},
    	}

    config.color_scheme = 'Tokyo Night Storm (Gogh)'
        config.window_decorations="INTEGRATED_BUTTONS|RESIZE"
    config.integrated_title_button_style = "Gnome"

    	config.window_background_opacity = 0.95
    return config
  '';
}
