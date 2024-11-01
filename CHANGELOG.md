## 1.4.0 (2024-10-31)

### Feat

- **programs**: add json2struct
- added zed editor
- **neovim**: added json2struct
- **neovim**: go
- Added stylix
- **go.lua**: go-nvim updates
- **neovim/go**: enable luasnip integration
- added cpufreq and vault
- **programs.nix**: added idea community and enabled rerere
- *****: updates
- system updates and upgrades
- **programs.nix**: added datagrip
- **go-flake.nix**: updated delve, golines and gotest packages to use packages from nixpkgs
- **programs.nix**: Added sesh
- **filetype/go.lua**: going for default go-nvim config
- **programs.nix**: Add battery reader for corne
- **battery.nix**: Added battery checking script
- **programs.nix**: Added unzip
- **zsh**: enable syntax Highlighting
- **zsh**: add atuin
- **flake.lock**: update dep
- **neovim**: vim-base64
- **neovim**: update neorg (#7)
- **neovim**: neorg config
- **wezterm**: Add all font styles for wezterm
- **flake.nix**: removed godlv custom package
- **ageFile**: add filetype support
- **ageFile**: add ageFile
- **shell-scripts**: Age encryption and decryption
- **neovim**: postgres-lsp
- **neovim-&-gh**: base64 improvement and disable GH modules
- **neovim**: base64 encode and decode
- **neovim**: neodev setup
- **neovim**: lua lsp
- **neovim**: vim-sops init
- **neovim**: dap
- **shell-flakes**: kafka flake init
- **neovim**: rust toolchatin
- **neovim**: moving to nightly and fixing treesitter context commentstring
- **i3**: added config

### Fix

- **pre-commit-config**: migrate config
- **neovim**: enable treesitter again
- **configuration.nix**: network change
- **neovim**: remove astro ls
- move bumblebee-status to stable
- **neovim**: add markdown_oxide
- network
- Add yazi
- **neovim**: remove some plugins
- updates
- **tmux**: sesh updates
- **tmux**: move to nixpkgs sesh and improve setup
- **zsh**: change atuin search mode
- **neovim**: move neorg and nvim-dap-ui to unstable-small for nvim-nio
- **serverconfig.lua**: remove rnix lsp
- **neovim**: remove telescope frequency
- **neovim**: change notify to static
- **go.lua**: fix go lsp
- **serverconfig.lua**: add go lsp
- **neovim**: Fix max lines in treesitter context
- **programs.nix**: remove poetry
- **neovim**: update harpoon and associated keymaps
- **neovim**: fix base64enc
- **neovim**: fix vim-sops package
- **flake.lock**: regen flake.lock
- **neovim**: fix go.nvim
- **neovim**: disable harpoon
- **kafka.nix**: working kafka flake (#5)

### Refactor

- updates
- **overlays**: relocated self

## 1.3.0 (2023-12-03)

### Feat

- *****: upgrade everything for new laptop
- **i3**: add bumblebee status
- **wezterm**: change font to Maple Mono
- added kafka and diffview-nvim
- **legion**: reinstall virtualbox
- **libvertd**: libvertd setup
- **neovim**: add python setup
- **programs/legion**: add doppler
- **neovim**: remove null-ls
- **git**: set up autoSetupRemote

### Fix

- *****: system fixes
- **firefox**: swap firefox overlay
- **configuration.nix**: fix firefox and nvidia driver sources
- **flake.nix**: fix poetry overlay
- **neovim**: fix yamlls
- **go**: change to go 1.21

## 1.2.0 (2023-09-09)

### Feat

- **legion**: added bashmount
- moving to 23.05 for now
- regen hardware config
- **neovim**: remove lspcontainers
- java stuff
- **legion.configuration.nix**: exposed 8802 port for packer
- **neovim**: remove mini animate
- **nvim**: reorder cmp sources
- **legion/configuration.nix**: autoconnection of home wifi
- **i3wsr**: thunar icon
- thudar file manager
- **overlays**: golines,gotest and godlv packaging
- **overlays**: godlv pkg
- **neovim**: buf lsp
- **wezterm+configuration.nix**: change to Lilex font
- **neovim**: telescope diagnostics mapping
- **neovim**: trim neovim
- **programs-legion**: kubernetes helpers
- **neovim**: qmk-nvim
- **neovim**: moving to new api
- **neovim**: trim neovim and bundles
- **neovim**: more mini plugins
- **neovim**: init mini.starter
- **git**: new log format
- **tmux-sessionizer**: go 2 levels deep and new directory
- **justfile**: build command
- **shell-flakes**: initial shell flakes for my devshells
- **neovim**: lsp lines
- **kubernetes**: two clusters setup
- **kubernetes**: kubernetes setup
- **neovim**: tailwind lsp
- **neovim.nix**: move to nvim 0.9 stable
- **zsh**: move any-nix-shell to home-manager
- **legion/configuration.nix**: tailscale setup
- **neovim**: copilot setup
- **serverconfig**: changed lsp keybindings
- **neovim.nix**: astro ls

### Fix

- **neovim**: move to version 9
- **configuration.nix**: fonts.fonts-> fonts.packages
- **neovim**: remove lspcontainers command
- **neovim**: change keymaps and cleanup
- **neovim**: remove clangd from proto files
- **overlays**: remove golines
- **overlays**: remove gotest
- **overlays**: fix
- **overlays**: fix source
- **overlays**: fix source
- **neovim**: fix cyclekeymap keymaps(json traverse)
- **neovim**: fix cyclekeymaps
- **neovim**: clangd filetypes
- **neovim**: move astro to latest
- **go-flake.nix**: remove cobra stuff
- **justfile**: changed commit command
- **neovim**: fixed neovim overlay
- **neovim**: unstable but fixed nvim
- update dep
- **neovim**: fix code actions
- **tmux.nix**: fix tmux-sessionizer dep
- **flake.nix**: removed stable branch
- **treesitter**: removed unused mappings
- **treesitter**: remove unnecessary keymaps

### Refactor

- **neovim**: cleanup derivations
- remove hyprland

## 1.1.0 (2023-03-14)

### Feat

- **zsh**: shell improvements
- git workflow improvements
- **justfile**: swapped update commit command with cz

## 1.0.0 (2023-03-08)

### Feat

- **rofi**: moved rofi to module
- **git.nix**: converted git file to module
- pre-commit config

## 0.1.0 (2023-03-06)

### Feat

- **legion/programs.nix**: commitizen+pre-commit

### Fix

- formatter
