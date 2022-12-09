{ pkgs, inputs, ... }:
let

  # typescript-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
  #   name = "typescript.nvim";
  #   doCheck = false;
  #   doInstallCheck = false;
  #   src = inputs.typescript-nvim;
  # };
  # autosave-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
  #   name = "autosave.nvim";
  #   src = inputs.autosave-nvim;
  # };
  #
  # astro-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
  #   name = "vim-astro";
  #   src = inputs.astro-vim;
  # };
  # drop-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
  #   name = "drop.nvim";
  #   src = inputs.drop-nvim;
  # };
  # go-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
  #   name = "go-nvim";
  #   src = inputs.go-nvim;
  # };
  #
  # guihua-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
  #   name = "guihua-lua";
  #   src = inputs.guihua-nvim;
  # };
  # nvim-dap-go = pkgs.vimUtils.buildVimPluginFrom2Nix {
  #   name = "nvim-dap-go";
  #   src = inputs.nvim-dap-go;
  # };
  vimPlugins = with pkgs.vimPlugins; [
    vim-nix
    vim-tmux
    plenary-nvim
    popup-nvim
    nui-nvim
    vim-rooter

    # completion
    nvim-cmp
    cmp-tabnine
    luasnip
    cmp_luasnip
    cmp-nvim-lua
    cmp-nvim-lsp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    lspkind-nvim

    #Telescope
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-ui-select-nvim
    telescope-project-nvim
    telescope-frecency-nvim
    telescope-dap-nvim

    # Folke stuff
    todo-comments-nvim
    lsp-colors-nvim
    trouble-nvim
    which-key-nvim

    # Lsp
    nvim-lsp-ts-utils
    nvim-lspconfig
    SchemaStore-nvim
    nvim-jdtls
    vim-signature
    popfix
    nvim-lsputils
    rust-tools-nvim
    symbols-outline-nvim
    nvim-lint
    nvim-surround
    neogit
    vim-scriptease
    comment-nvim
    nvim-ts-context-commentstring

    #DAP

    nvim-dap
    #use("mfussenegger/nvim-dap-python")
    nvim-dap-virtual-text
    #use("David-Kunz/jester")
    nvim-dap-ui

    # Treesitter

    cmp-treesitter
    nvim-treesitter-textobjects
    nvim-treesitter-context

    #Prime stuff
    harpoon
    git-worktree-nvim

    #Other stuff
    rainbow_parentheses-vim
    #should move to format.nvim
    neoformat
    vim-startify
    lualine-nvim
    lualine-lsp-progress
    nvim-notify
    nvim-autopairs
    lightspeed-nvim
    vim-numbertoggle
    diffview-nvim
    numb-nvim
    null-ls-nvim
    i3config-vim
    nvim-ts-autotag
    fidget-nvim
    neorg
    vim-qf
    ansible-vim
    git-blame-nvim
    gitsigns-nvim
    noice-nvim

    live-command-nvim
    playground
    impatient-nvim

    hydra-nvim
    tokyonight-nvim
  ];
  customVimPlugins = with pkgs.customVimPlugins;[
    go-nvim
    guihua-lua
    inc-rename-nvim
    lspcontainers-nvim
    cyclist-nvim
    typescript-nvim
    # autosave-nvim
    nvim-dap-go
    astro-vim
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
      ccls
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
