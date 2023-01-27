inputs: self: super:
{

  customTmuxPlugins = with self ;{
    tokyonight = pkgs.tmuxPlugins.mkTmuxPlugin {
      name = "tokyo-night-tmux";
      pluginName = "tokyo-night-tmux";
      rtpFilePath = "tokyo-night.tmux";
      src = inputs.tokyonight-tmux;
    };
  };
  customVimPlugins = with self;{
    lspcontainers-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "lspcontainers.nvim";
      src = inputs.lspcontainers-nvim;
    };

    inc-rename-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "inc-rename.nvim";
      src = inputs.inc-rename;
    };

    cyclist-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "cyclist.vim";
      src = inputs.cyclist-nvim;
    };
    typescript-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "typescript.nvim";
      doCheck = false;
      doInstallCheck = false;
      src = inputs.typescript-nvim;
    };
    autosave-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "autosave.nvim";
      src = inputs.autosave-nvim;
    };

    astro-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "vim-astro";
      src = inputs.astro-vim;
    };
    drop-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "drop.nvim";
      src = inputs.drop-nvim;
    };
    go-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "go-nvim";
      src = inputs.go-nvim;
    };

    regexplainer = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "nvim-regexplainer";
      src = inputs.regexplainer;
    };
    guihua-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "guihua-lua";
      src = inputs.guihua-nvim;
    };
    nvim-dap-go = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "nvim-dap-go";
      src = inputs.nvim-dap-go;
    };

    vim-just = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "vim-just";
      src = inputs.vim-just;
    };

    noice-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "noice-nvim";
      src = inputs.noice-nvim;
    };

    statuscol-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "statuscol-nvim";
      src = inputs.statuscol-nvim;
    };

    treesitter-just = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "treesitter-just";
      src = inputs.treesitter-just;
    };

    hover-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "hover-nvim";
      src = inputs.hover-nvim;
    };
    # codeium-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    #   name = "codeium-vim";
    #   src = inputs.codeium-vim;
    # };
    adgai-config = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "adgai";
      src = ./config/nvim-config;
    };
  };

}
