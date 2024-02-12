inputs: packages: self: super:
{

  customTmuxPlugins = with self ;{
    tokyonight = pkgs.tmuxPlugins.mkTmuxPlugin {
      name = "tokyo-night-tmux";
      pluginName = "tokyo-night-tmux";
      rtpFilePath = "tokyo-night.tmux";
      src = inputs.tokyonight-tmux;
    };
    base16-tmux = pkgs.tmuxPlugins.mkTmuxPlugin {
      name = "base16-tmux";
      pluginName = "base16-tmux";
      rtpFilePath = "base16-tmux";
      src = inputs.base16-tmux;
    };
  };
  customFonts = {
    Lilix = self.pkgs.stdenv.mkDerivation {
      pname = "Lilex";
      version = "2.200";

      src = self.pkgs.fetchzip {
        url = "https://github.com/mishamyrt/Lilex/releases/download/2.200/Lilex.zip";
        sha256 = "sha256-MPQfqCMFMjcAlMos1o4bC+I+cvQYwr2TjI4Q03QeuaQ=";
        stripRoot = false;
      };

      installPhase = ''
        mkdir -p $out/share/fonts/ttf
        mv ttf/*.ttf $out/share/fonts/ttf
      '';
    };
  };

  customPkgs = with self;{
    inherit (packages.${system}) ageEnc ageDec ageFile battery;

  };

  customVimPlugins = with self;{
    inc-rename-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "inc-rename.nvim";
      src = inputs.inc-rename;
    };
    harpoon-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "harpoon-nvim";
      src = inputs.harpoon-nvim;
    };
    vim-base64 = pkgs.vimUtils.buildVimPlugin {
      name = "vim-base64";
      src = inputs.vim-base64;
    };

    cyclist-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "cyclist.vim";
      src = inputs.cyclist-nvim;
    };
    typescript-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "typescript.nvim";
      doCheck = false;
      doInstallCheck = false;
      src = inputs.typescript-nvim;
    };
    autosave-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "autosave.nvim";
      src = inputs.autosave-nvim;
    };

    astro-vim = pkgs.vimUtils.buildVimPlugin {
      name = "vim-astro";
      src = inputs.astro-vim;
    };

    go-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "go-nvim";
      src = inputs.go-nvim;
    };

    regexplainer = pkgs.vimUtils.buildVimPlugin {
      name = "nvim-regexplainer";
      src = inputs.regexplainer;
    };
    guihua-lua = pkgs.vimUtils.buildVimPlugin {
      name = "guihua-lua";
      src = inputs.guihua-nvim;
    };
    nvim-dap-go = pkgs.vimUtils.buildVimPlugin {
      name = "nvim-dap-go";
      src = inputs.nvim-dap-go;
    };
    vim-sops = pkgs.vimUtils.buildVimPlugin {
      name = "vim-sops";
      src = inputs.vim-sops;
    };

    vim-just = pkgs.vimUtils.buildVimPlugin {
      name = "vim-just";
      src = inputs.vim-just;
    };

    noice-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "noice-nvim";
      src = inputs.noice-nvim;
    };

    statuscol-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "statuscol-nvim";
      src = inputs.statuscol-nvim;
    };

    treesitter-just = pkgs.vimUtils.buildVimPlugin {
      name = "treesitter-just";
      src = inputs.treesitter-just;
    };

    hover-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "hover-nvim";
      src = inputs.hover-nvim;
    };

    jester = pkgs.vimUtils.buildVimPlugin {
      name = "jester";
      src = inputs.jester;
    };

    neotest-jest = pkgs.vimUtils.buildVimPlugin {
      name = "neotest-jest";
      src = inputs.neotest-jest;
    };

    dap-vscode = pkgs.vimUtils.buildVimPlugin {
      name = "dap-vscode";
      src = inputs.dap-vscode;
    };

    treesj = pkgs.vimUtils.buildVimPlugin {
      name = "treesj";
      src = inputs.treesj;
    };

    qmk-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "qmk-nvim";
      src = inputs.qmk-nvim;
    };

    adgai-config = pkgs.vimUtils.buildVimPlugin {
      name = "adgai";
      src = ./config/nvim-config;
    };
  };

}
