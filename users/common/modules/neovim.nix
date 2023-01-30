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
    todo-comments-nvim
    trouble-nvim

    # Lsp
    SchemaStore-nvim
    comment-nvim
    neogit
    nvim-jdtls
    nvim-lint
    nvim-lsp-ts-utils
    nvim-lspconfig
    nvim-lsputils
    nvim-surround
    nvim-ts-context-commentstring
    lsp-zero-nvim
    popfix
    rust-tools-nvim
    symbols-outline-nvim
    vim-scriptease
    vim-signature

    #DAP

    nvim-dap
    #use("mfussenegger/nvim-dap-python")
    nvim-dap-virtual-text
    #use("David-Kunz/jester")
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
    diffview-nvim
    fidget-nvim
    formatter-nvim
    git-blame-nvim
    gitsigns-nvim
    hydra-nvim
    i3config-vim
    impatient-nvim
    indent-blankline-nvim
    lightspeed-nvim
    live-command-nvim
    lualine-lsp-progress
    lualine-nvim
    neoformat
    neorg
    null-ls-nvim
    numb-nvim
    nvim-autopairs
    nvim-notify
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
    # autosave-nvim
    adgai-config
    astro-vim
    # codeium-vim
    cyclist-nvim
    go-nvim
    guihua-lua
    hover-nvim
    inc-rename-nvim
    lspcontainers-nvim
    noice-nvim
    regexplainer
    statuscol-nvim
    treesitter-just
    typescript-nvim
    vim-just
    # drop-nvim
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
    extraConfig = ''
      lua require('adgai').init()
    '';
    extraPackages = with pkgs; [
      rnix-lsp
      gopls
      shellcheck
      # ansible-lint
      fd
      git
      lua51Packages.sqlite
      # python310Packages.jedi-language-server
      nodePackages."@prisma/language-server"
      nodePackages."bash-language-server"
      nodePackages."dockerfile-language-server-nodejs"
      nodePackages.graphql-language-service-cli
      nodePackages.pyright
      nodePackages_latest.vim-language-server
      nodePackages."vscode-langservers-extracted"
      nodePackages.write-good
      nodePackages."yaml-language-server"
      rust-analyzer
      sumneko-lua-language-server
      terraform-ls
      ccls
      nil

      nodePackages.typescript
      nodePackages.typescript-language-server
    ];
  };
}
