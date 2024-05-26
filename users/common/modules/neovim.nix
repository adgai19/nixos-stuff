{ pkgs, pkgs-unstable-small, inputs, ... }:
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
    cmp-nvim-lua
    cmp-path
    # cmp-tabnine
    cmp_luasnip
    lspkind-nvim
    luasnip

    # copilot
    cmp-copilot
    copilot-vim

    #Telescope
    telescope-dap-nvim
    # telescope-frecency-nvim
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
    {
      plugin = neodev-nvim;
      config = "lua require('neodev').setup()";
    }


    # Lsp
    SchemaStore-nvim
    friendly-snippets
    lsp-zero-nvim
    neogit
    nvim-jdtls
    nvim-lint
    nvim-lsp-ts-utils
    nvim-lspconfig
    nvim-ts-context-commentstring
    popfix
    # rust-tools-nvim
    symbols-outline-nvim
    vim-scriptease
    vim-signature
    {
      plugin = comment-nvim;
      config = "lua require('Comment').setup()";
    }
    {
      plugin = lsp_lines-nvim;
      config = "lua require('lsp_lines').setup()";
    }
    {
      plugin = nvim-surround;
      config = "lua require('nvim-surround').setup()";
    }

    #DAP
    neotest
    nvim-dap
    nvim-dap-go
    # nvim-dap-ui
    nvim-dap-virtual-text

    # Treesitter
    cmp-treesitter
    nvim-treesitter-context
    nvim-treesitter-textobjects
    nvim-treesitter

    #Prime stuff
    git-worktree-nvim


    #Other stuff

    diffview-nvim
    ansible-vim
    catppuccin-nvim
    dressing-nvim
    fidget-nvim
    formatter-nvim
    git-blame-nvim
    hydra-nvim
    i3config-vim
    impatient-nvim
    indent-blankline-nvim
    kanagawa-nvim
    live-command-nvim
    lualine-lsp-progress
    lualine-nvim
    mini-nvim
    neo-tree-nvim
    neoformat

    # neorg-telescope
    # null-ls-nvim
    numb-nvim
    nvim-notify
    nvim-ts-autotag
    nvim-web-devicons
    rainbow_parentheses-vim
    tokyonight-nvim
    vim-numbertoggle
    vim-qf
    vim-terraform
    vim-dispatch


    {
      plugin = gitsigns-nvim;
      config = "lua require('gitsigns').setup()";
    }
    {
      plugin = flit-nvim;
      config = "lua require('flit').setup()";

    }
    {
      plugin = leap-nvim;
      config = "lua require('leap').add_default_mappings()";
    }
    {
      plugin = nvim-autopairs;
      config = "lua require('nvim-autopairs').setup({})";
    }
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
    harpoon-nvim
    hover-nvim
    inc-rename-nvim
    jester
    vim-sops
    neotest-jest
    noice-nvim
    treesitter-just
    treesj
    typescript-nvim
    vim-just
    qmk-nvim
    vim-base64
    nvim-cmp
  ] ++ [ inputs.rustaceanvim.packages.${pkgs.system}.rustaceanvim pkgs.lua51Packages.nvim-nio ];
  unstableSmallPlugins = with pkgs-unstable-small.vimPlugins;[ ];

in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    package = inputs.neovim-nightly.packages.${pkgs.system}.neovim;
    vimAlias = true;
    withNodeJs = false;
    withPython3 = false;
    plugins = vimPlugins
      ++ customVimPlugins
      ++ (with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-treesitter.builtGrammars.tree-sitter-norg
      nvim-treesitter.builtGrammars.tree-sitter-norg-meta

    ]) ++ unstableSmallPlugins;
    extraPackages = with pkgs; [
      fd
      git
      gnumake
      luajitPackages.lua-lsp
      nil
      nodePackages."dockerfile-language-server-nodejs"
      nodePackages."vscode-langservers-extracted"
      nodePackages."yaml-language-server"
      nodePackages.eslint
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages_latest."@astrojs/language-server"
      nodePackages_latest.pyright
      nodePackages_latest.vim-language-server
      postgres-lsp
      python311Packages.jedi-language-server
      python311Packages.python-lsp-server
      shellcheck
      sumneko-lua-language-server
    ] ++ (with pkgs.customPkgs;[ json2struct ]);
  };
}
