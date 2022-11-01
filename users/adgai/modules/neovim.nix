{ pkgs, inputs, ... }:
let
  lspcontainers-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "lspcontainers.nvim";
    src = inputs.lspcontainers-nvim;
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

in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    package = inputs.neovim-nightly.packages.${pkgs.system}.neovim;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
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
      vimPlugins.neogit
      vimPlugins.vim-scriptease
      vimPlugins.comment-nvim
      vimPlugins.nvim-ts-context-commentstring

      #DAP

      vimPlugins.nvim-dap
      #use("mfussenegger/nvim-dap-python")
      vimPlugins.nvim-dap-virtual-text
      #use("David-Kunz/jester")
      vimPlugins.nvim-dap-ui

      # Treesitter
      # (vimPlugins.nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
      # vimPlugins.nvim-treesitter
      # (pkgs.vimPlugins.nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))

      # vimPlugins.cmp-treesitter
      # vimPlugins.nvim-treesitter-textobjects
      # vimPlugins.nvim-treesitter-context

      #Prime stuff
      vimPlugins.harpoon
      vimPlugins.git-worktree-nvim

      #Other stuff
      vimPlugins.rainbow_parentheses-vim
      #should move to format.nvim
      vimPlugins.neoformat
      # vimPlugins.vim-startify
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
      vimPlugins.nvim-ts-autotag
      vimPlugins.fidget-nvim
      vimPlugins.neorg
      vimPlugins.vim-qf
      vimPlugins.ansible-vim
      vimPlugins.git-blame-nvim
      vimPlugins.gitsigns-nvim
      vimPlugins.noice-nvim

      vimPlugins.live-command-nvim
      lspcontainers-nvim
      # tsplayground
      vimPlugins.playground
      vimPlugins.impatient-nvim

      vimPlugins.tokyonight-nvim
      vimExtraPlugins.inc-rename-nvim
      vimExtraPlugins.go-nvim
      vimExtraPlugins.guihua-lua
      vimExtraPlugins.hydra-nvim

      cyclist-nvim
      typescript-nvim
      autosave-nvim
      astro-vim
      # drop-nvim
    ];
    extraConfig = ''
      luafile $HOME/.config/nvim/lua/general.lua
      luafile $HOME/.config/nvim/lua/autocmds.lua
      luafile $HOME/.config/nvim/lua/keymaps/init.lua
      luafile $HOME/.config/nvim/lua/adgai/init.lua
    '';
    extraPackages = with pkgs; [
      # treesitter
      rnix-lsp
      gopls
      shellcheck
      ansible-lint
      fd
      python310Packages.jedi-language-server
      nodePackages."@prisma/language-server"
      nodePackages."bash-language-server"
      nodePackages."dockerfile-language-server-nodejs"
      # nodePackages."graphql-language-service-cli"
      nodePackages."pyright"
      nodePackages."typescript"
      nodePackages."typescript-language-server"
      nodePackages."vscode-langservers-extracted"
      nodePackages.write-good
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
