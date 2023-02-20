{ pkgs, inputs, system, ... }:
let
  nixpkgs-patched-wezterm = (import inputs.nixpkgs {
    inherit system;
  }).applyPatches{
    name = "wezterm-fix";
    src = inputs.nixpkgs;
    patches = [./nixpkgs-wezterm-fix.patch ];
  };

  pkgs-wezterm-patch = import nixpkgs-patched-wezterm{
    inherit system;
    config = { allowUnfree = true; };
  };

in
{
  programs.wezterm.enable = true;
  programs.kitty.enable = true;
  programs.wezterm.package = pkgs-wezterm-patch.wezterm;

  programs.wezterm.extraConfig = ''
    local wezterm = require 'wezterm'
    return {
      force_reverse_video_cursor = true,

      set_environment_variables = {
        TERMINFO_DIRS = '/home/user/.nix-profile/share/terminfo',
        WSLENV = 'TERMINFO_DIRS',
      },
      term = 'wezterm',
      colors = {
        foreground = "#dcd7ba",
        background = "#1f1f28",

        cursor_bg = "#c8c093",
        cursor_fg = "#c8c093",
        cursor_border = "#c8c093",

        selection_fg = "#c8c093",
        selection_bg = "#2d4f67",

        scrollbar_thumb = "#16161d",
        split = "#16161d",

        ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
        brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
        indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
        },
      enable_wayland = false;
      window_background_opacity = 0.95,
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
