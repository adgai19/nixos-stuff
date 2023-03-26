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
      config = "lua require('todo-comments').setup()";
    }
    {
      plugin = trouble-nvim;
      config = "lua require('trouble').setup()";
    }

    # Lsp
    SchemaStore-nvim
    {
      plugin = comment-nvim;
      config = "lua require('Comment').setup()";
    }
    neogit
    nvim-jdtls
    nvim-lint
    nvim-lsp-ts-utils
    nvim-lspconfig
    nvim-lsputils
    friendly-snippets
    {
      plugin = nvim-surround;
      config = "lua require('nvim-surround').setup()";
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
    # diffview-nvim
    fidget-nvim
    formatter-nvim
    git-blame-nvim
    {
      plugin = gitsigns-nvim;
      config = "lua require('gitsigns').setup()";
    }
    hydra-nvim
    i3config-vim
    impatient-nvim
    indent-blankline-nvim
    # lightspeed-nvim

    {
      plugin = flit-nvim;
      config = "lua require('flit').setup()";

    }
    {
      plugin = leap-nvim;
      config = "lua require('statuscol').setup({ setopt = true })";
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
      config = "lua require('nvim-autopairs').setup({})";
    }
    {
      plugin = nvim-notify;
      # config = "lua require('notify').setup({ background_colour = '#000000'}) ";
    }
    nvim-ts-autotag
    nvim-web-devicons
    playground
    rainbow_parentheses-vim
    tokyonight-nvim
    vim-numbertoggle
    vim-qf
    vim-terraform
    # vim-startify
    neo-tree-nvim
  ];

  customVimPlugins = with pkgs.customVimPlugins;[
    {
      plugin = adgai-config;
      config = "lua require('adgai').init()";
    }
    {
      plugin = regexplainer;
      config = "lua require('regexplainer').setup()";
    }
    {
      plugin = statuscol-nvim;
      config = "lua require('statuscol').setup({ setopt = true })";

    }
    astro-vim
    cyclist-nvim
    dap-vscode
    go-nvim
    guihua-lua
    hover-nvim
    inc-rename-nvim
    jester
    lspcontainers-nvim
    neotest-jest
    noice-nvim
    treesitter-just
    treesj
    typescript-nvim
    vim-just
    codeium
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
    plugins = vimPlugins
      ++ customVimPlugins
      ++ (with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ]);
    extraPackages = with pkgs; [

      # ansible-lint
      # python310Packages.jedi-language-server
      ansible-language-server
      clang-tools
      fd
      git
      gopls
      haskell-language-server
      nil
      rnix-lsp
      rust-analyzer
      shellcheck
      sumneko-lua-language-server
      terraform-ls
      terraform-lsp

      lua51Packages.sqlite

      nodePackages."@astrojs/language-server"
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
