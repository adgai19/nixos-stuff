self: super:
let
  sources = ../../nix/sources.nix;
in
{
  customTmux = with self;{
    tokyonight = pkgs.tmuxPlugins.mkTmuxPlugin {
      name = "tokyo-night-tmux";
      pluginName = "tokyo-night-tmux";
      rtpFilePath = "tokyo-night.tmux";
      src = sources.tokyo-night-tmux;
    };
  };
  customVim = with self;{
    gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "gitsigns.nvim";
      src = sources."gitsigns.nvim";
    };
  };
}

