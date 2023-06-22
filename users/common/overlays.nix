inputs: self: super:
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

  customPkgs = {
    godlv = self.pkgs.buildGoModule rec{
      pname = "godlv";
      src = inputs.godlv;
      vendorSha256 = null;
      name = pname;
      proxyVendor = true;
      doCheck = false;

    };

    golines = self.pkgs.buildGoModule rec{
      pname = "golines";
      src = inputs.golines;
      vendorSha256 = "sha256-It7lD8Ix9oX8xXILCnWUfit9ZlPJ4zjMElNa14mCkGI=";
      name = pname;
      proxyVendor = true;
    };

    gotest = self.pkgs.buildGoModule rec{
      pname = "gotest.tools";
      src = inputs.gotest;
      vendorSha256 = null;
      name = pname;
      proxyVendor = true;
      doCheck = false;
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

    jester = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "jester";
      src = inputs.jester;
    };

    neotest-jest = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "neotest-jest";
      src = inputs.neotest-jest;
    };

    dap-vscode = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "dap-vscode";
      src = inputs.dap-vscode;
    };

    treesj = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "treesj";
      src = inputs.treesj;
    };

    qmk-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "qmk-nvim";
      src = inputs.qmk-nvim;
    };

    adgai-config = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "adgai";
      src = ./config/nvim-config;
    };
  };

}
