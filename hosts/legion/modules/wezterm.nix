{ pkgs, inputs, system, ... }:
{
  programs.wezterm.enable = true;
  programs.kitty.enable = true;
  programs.wezterm.package =     inputs.wezterm.packages.${pkgs.system}.default;

  # set_environment_variables = {
  #   TERMINFO_DIRS = '/home/user/.nix-profile/share/terminfo',
  # },
  programs.wezterm.extraConfig = ''
    local wezterm = require("wezterm")
    local config = {}

    if wezterm.config_builder then
    	config = wezterm.config_builder()
    end

    config.force_reverse_video_cursor = true

    config.term = "wezterm"
    config.enable_wayland = false
    -- # config.font = wezterm.font("Maple Mono",weight = 'Bold',)

    config.font = wezterm.font("Maple Mono", { weight = "Light", stretch = "Normal", style = "Normal" }) -- /nix/store/cfksksxph9xkaav8vrkrzsrc3p2vpmal-MapleMono-ttf-6.4/share/fonts/truetype/MapleMono-Light.ttf, FontConfig
    config.font = wezterm.font("Maple Mono", { weight = "Light", stretch = "Normal", style = "Italic" }) -- /nix/store/cfksksxph9xkaav8vrkrzsrc3p2vpmal-MapleMono-ttf-6.4/share/fonts/truetype/MapleMono-LightItalic.ttf, FontConfig
    config.font = wezterm.font("Maple Mono", { weight = "Regular", stretch = "Normal", style = "Normal" }) -- /nix/store/cfksksxph9xkaav8vrkrzsrc3p2vpmal-MapleMono-ttf-6.4/share/fonts/truetype/MapleMono-Regular.ttf, FontConfig
    config.font = wezterm.font("Maple Mono", { weight = "Regular", stretch = "Normal", style = "Italic" }) -- /nix/store/cfksksxph9xkaav8vrkrzsrc3p2vpmal-MapleMono-ttf-6.4/share/fonts/truetype/MapleMono-Italic.ttf, FontConfig
    config.font = wezterm.font("Maple Mono", { weight = "Bold", stretch = "Normal", style = "Normal" }) -- /nix/store/cfksksxph9xkaav8vrkrzsrc3p2vpmal-MapleMono-ttf-6.4/share/fonts/truetype/MapleMono-Bold.ttf, FontConfig
    config.font = wezterm.font("Maple Mono", { weight = "Bold", stretch = "Normal", style = "Italic" }) -- /nix/store/cfksksxph9xkaav8vrkrzsrc3p2vpmal-MapleMono-ttf-6.4/share/fonts/truetype/MapleMono-BoldItalic.ttf, FontConfig
    config.enable_tab_bar = false
    config.font_size = 9
    config.keys = {
    	{
    		key = "n",
    		mods = "SHIFT|CTRL",
    		action = wezterm.action.ToggleFullScreen,
    	},
    }

    config.color_scheme = "Tokyo Night Storm (Gogh)"
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    config.integrated_title_button_style = "Gnome"

    config.window_background_opacity = 0.95
    return config
  '';
}
