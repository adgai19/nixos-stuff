inputs: self: super:
{
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

    guihua-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "guihua-lua";
      src = inputs.guihua-nvim;
    };
    nvim-dap-go = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "nvim-dap-go";
      src = inputs.nvim-dap-go;
    };
  };
}
