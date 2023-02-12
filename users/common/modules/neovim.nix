{ pkgs, inputs, ... }:
let
  vimPlugins = with pkgs.vimPlugins; [
    nui-nvim
    plenary-nvim
    popup-nvim
    vim-nix
    vim-rooter
    vim-tmux

    # completion
    cmp-buffer
    cmp-nvim-lsp
    cmp-nvim-lsp
    cmp-nvim-lua
    cmp-path
    cmp-tabnine
    cmp_luasnip
    lspkind-nvim
    luasnip
    nvim-cmp

    #Telescope
    telescope-dap-nvim
    telescope-frecency-nvim
    telescope-fzf-native-nvim
    telescope-nvim
    telescope-project-nvim
    telescope-ui-select-nvim

    # Folke stuff
    lsp-colors-nvim
    {
      plugin = todo-comments-nvim;
      config = " require('todo-comments').setup()";
      type = "lua";
    }
    {
      plugin = trouble-nvim;
      config = " require('trouble').setup()";
      type = "lua";
    }

    # Lsp
    SchemaStore-nvim
    {
      plugin = comment-nvim;
      config = " require('Comment').setup()";
      type = "lua";
    }
    neogit
    nvim-jdtls
    nvim-lint
    nvim-lsp-ts-utils
    nvim-lspconfig
    nvim-lsputils
    {
      plugin = nvim-surround;
      config = "require('nvim-surround').setup()";
      type = "lua";
    }
    nvim-ts-context-commentstring
    lsp-zero-nvim
    popfix
    rust-tools-nvim
    symbols-outline-nvim
    vim-scriptease
    vim-signature

    #DAP

    nvim-dap

    neotest
    #use("mfussenegger/nvim-dap-python")
    nvim-dap-virtual-text
    nvim-dap-ui
    nvim-dap-go

    # Treesitter
    cmp-treesitter
    nvim-treesitter-context
    nvim-treesitter-textobjects

    #Prime stuff
    harpoon
    git-worktree-nvim

    #Other stuff
    #should move to format.nvim
    ansible-vim
    catppuccin-nvim

    kanagawa-nvim
    diffview-nvim
    fidget-nvim
    formatter-nvim
    git-blame-nvim
    {
      plugin = gitsigns-nvim;
      config = "require(" gitsigns ").setup()";
      type = "lua";
    }
    hydra-nvim
    i3config-vim
    impatient-nvim
    indent-blankline-nvim
    # lightspeed-nvim

    {
      plugin = flit-nvim;
      type = "lua";
      config = "require('flit').setup()";

    }
    {
      plugin = leap-nvim;
      config = "require('statuscol').setup({ setopt = true })";
      type = "lua";
    }
    live-command-nvim
    lualine-lsp-progress
    lualine-nvim
    neoformat
    neorg
    null-ls-nvim
    numb-nvim
    {
      plugin = nvim-autopairs;
      config = "require(" nvim-autopairs ").setup({})";
      type = "lua";
    }
    {
      plugin = nvim-notify;
      config = " require('notify').setup({ background_colour = '#000000'}) ";
      type = "lua";
    }
    nvim-ts-autotag
    nvim-web-devicons
    playground
    rainbow_parentheses-vim
    tokyonight-nvim
    vim-numbertoggle
    vim-qf
    # vim-startify
    neo-tree-nvim
  ];

  customVimPlugins = with pkgs.customVimPlugins;[
    {
      plugin = adgai-config;
      config = "lua require('adgai').init()";
    }
    astro-vim
    cyclist-nvim
    go-nvim
    guihua-lua
    hover-nvim
    inc-rename-nvim
    jester
    lspcontainers-nvim
    noice-nvim
    {
      plugin = regexplainer;
      config = "require('regexplainer').setup()";
      type = "lua";
    }
    {
      plugin = statuscol-nvim;
      config = "require('statuscol').setup({ setopt = true })";
      type = "lua";

    }
    treesitter-just
    typescript-nvim
    vim-just
    neotest-jest
    dap-vscode


  ];

in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    package = inputs.neovim-nightly.packages.${pkgs.system}.neovim;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = (vimPlugins)
      ++ (customVimPlugins)
      ++ (with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ]);
    extraPackages = with pkgs; [

      # ansible-lint
      # python310Packages.jedi-language-server
      ansible-language-server
      ccls
      clang-tools
      fd
      git
      gopls
      nil
      rnix-lsp
      rust-analyzer
      shellcheck
      sumneko-lua-language-server
      terraform-ls
      haskell-language-server

      lua51Packages.sqlite

      nodePackages."@prisma/language-server"
      nodePackages."bash-language-server"
      nodePackages."dockerfile-language-server-nodejs"
      nodePackages."vscode-langservers-extracted"
      nodePackages."yaml-language-server"
      nodePackages.eslint
      nodePackages.graphql-language-service-cli
      nodePackages.pyright
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.write-good
      nodePackages_latest.vim-language-server
      nodePackages_latest.vue-language-server

      # python311Packages.python-lsp-server
    ];
  };
}
