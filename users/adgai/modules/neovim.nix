{ pkgs, ... }:
let
  lspcontainers-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "lspcontainers.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "lspcontainers";
      repo = "lspcontainers.nvim";
      sha256 = "sha256-aXx6pUFEYnzrq53wEWG9Z7Dt55EIIVfhh8iVQ2a+Y2c=";
      rev = "ea430ff6e155dc26f971573eb21422d77cf9d8f0";
    };
  };

  cyclist-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "cyclist.vim";
    src = pkgs.fetchFromGitHub {
      owner = "tjdevries";
      repo = "cyclist.vim";
      sha256 = "sha256-CpfY2luD59p4FM9cvGsn6pyEFMAUv1vi2+WL27e6Pjk=";
      rev = "d611ea3a21365f90d512dd024874e070e864309e";

    };
  };

  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "gitsigns.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "d7e0bcbe45bd9d5d106a7b2e11dc15917d272c7a";
      sha256 = "sha256-kyiQoboYq4iNLOj1iKA2cfXQ9FFiRYdvf55bX5Xvj8A=";
    };
  };
  typescript-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "typescript.nvim";
    doCheck = false;
    doInstallCheck = false;
    src = pkgs.fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "typescript.nvim";
      sha256 = "sha256-ElRJOWxiuCZaKv8agpm9UxgJ0Zj4SBARWGggLxEn4+I=";
      rev = "5a92e7658e693b2ba6e14e851b8795ae3d727f23";
    };
  };
  autosave-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "autosave.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "Pocco81";
      repo = "auto-save.nvim";
      rev = "2c7a2943340ee2a36c6a61db812418fca1f57866";
      sha256 = "sha256-keK+IAnHTTA5uFkMivViMMAkYaBvouYqcR+wNPgN3n0=";
    };
  };

  noice-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "noice.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "3a23308e205f35fc2b80b93790fd3a92587d68e7";
      sha256 = "sha256-H3y1rWDyeYOr6no1/CZPoshEoaGIrMia8y9QfeGMdEc=";
    };
  };

in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    # package = pkgs.neovim-nightly;
    # package = inputs.neovim-nightly.packages.${pkgs.system}.neovim;
    vimAlias = true;
    plugins = with pkgs; [
      vimPlugins.vim-nix
      vimPlugins.vim-tmux
      vimPlugins.plenary-nvim
      vimPlugins.popup-nvim
      vimPlugins.nui-nvim
      vimPlugins.vim-rooter
      # completion
      vimPlugins.nvim-cmp
      vimPlugins.cmp-tabnine
      vimPlugins.luasnip
      vimPlugins.cmp_luasnip
      vimPlugins.cmp-nvim-lua
      vimPlugins.cmp-nvim-lsp
      vimPlugins.cmp-nvim-lsp
      vimPlugins.cmp-buffer
      vimPlugins.cmp-path
      vimPlugins.lspkind-nvim

      #Telescope
      vimPlugins.telescope-nvim
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.telescope-ui-select-nvim
      vimPlugins.telescope-project-nvim
      vimPlugins.telescope-frecency-nvim
      vimPlugins.telescope-dap-nvim

      # Folke stuff
      vimPlugins.todo-comments-nvim
      vimPlugins.lsp-colors-nvim
      vimPlugins.trouble-nvim
      vimPlugins.which-key-nvim

      # Lsp
      vimPlugins.nvim-lsp-ts-utils
      vimPlugins.nvim-lspconfig
      vimPlugins.SchemaStore-nvim
      vimPlugins.nvim-jdtls
      vimPlugins.vim-signature
      vimPlugins.popfix
      vimPlugins.nvim-lsputils
      vimPlugins.rust-tools-nvim
      vimPlugins.symbols-outline-nvim
      vimPlugins.nvim-lint
      vimPlugins.nvim-surround
      #vimPlugins.neogit
      vimPlugins.vim-scriptease
      vimPlugins.comment-nvim
      vimPlugins.nvim-ts-context-commentstring

      #DAP

      #use("mfussenegger/nvim-dap")
      #use("mfussenegger/nvim-dap-python")
      #use("theHamsta/nvim-dap-virtual-text")
      #use("David-Kunz/jester")
      #use("rcarriga/nvim-dap-ui")

      # Treesitter
      # (vimPlugins.nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
      vimPlugins.nvim-treesitter

      vimPlugins.cmp-treesitter
      vimPlugins.nvim-treesitter-textobjects
      vimPlugins.nvim-treesitter-context

      #Prime stuff
      vimPlugins.harpoon
      vimPlugins.git-worktree-nvim

      #Other stuff
      vimPlugins.rainbow_parentheses-vim
      #should move to format.nvim
      vimPlugins.neoformat
      vimPlugins.vim-startify
      vimPlugins.lualine-nvim
      vimPlugins.lualine-lsp-progress
      vimPlugins.nvim-notify
      vimPlugins.nvim-autopairs
      vimPlugins.lightspeed-nvim
      vimPlugins.vim-numbertoggle
      vimPlugins.diffview-nvim
      vimPlugins.numb-nvim
      vimPlugins.null-ls-nvim
      vimPlugins.i3config-vim
      #vimPlugins.gitsigns-nvim
      vimPlugins.nvim-ts-autotag
      vimPlugins.fidget-nvim
      vimPlugins.neorg
      vimPlugins.vim-qf
      vimPlugins.ansible-vim
      vimPlugins.git-blame-nvim
      #vimPlugins.neogit
      lspcontainers-nvim
      # tsplayground
      vimPlugins.playground

      vimPlugins.tokyonight-nvim
      vimExtraPlugins.inc-rename-nvim
      vimExtraPlugins.go-nvim
      vimExtraPlugins.guihua-lua
      vimExtraPlugins.hydra-nvim

      cyclist-nvim
      typescript-nvim
      autosave-nvim
      gitsigns-nvim
      noice-nvim
    ];
    extraConfig = ''
      luafile $HOME/.config/nvim/lua/general.lua
      luafile $HOME/.config/nvim/lua/autocmds.lua
      luafile $HOME/.config/nvim/lua/keymaps/init.lua
      luafile $HOME/.config/nvim/lua/adgai/init.lua
    '';
    extraPackages = with pkgs; [
    rnix-lsp
    gopls
    python310Packages.jedi-language-server
    nodePackages."@prisma/language-server"
    nodePackages."bash-language-server"
    nodePackages."dockerfile-language-server-nodejs"
    # nodePackages."graphql-language-service-cli"
    nodePackages."pyright"
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    nodePackages."vscode-langservers-extracted"
    nodePackages."yaml-language-server"
    rust-analyzer
    sumneko-lua-language-server
    terraform-ls
    ];
  };
  home.file."nvim-lua" = {
    source = ../config/nvim-config/lua;
    recursive = true;
    target = "/home/adgai/.config/nvim/lua";
  };

  home.file."nvim-after" = {
    source = ../config/nvim-config/after;
    recursive = true;
    target = "/home/adgai/.config/nvim/after";
  };
}
