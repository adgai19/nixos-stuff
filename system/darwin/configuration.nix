{ pkgs,home-manager,  ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget

# imports = [ home-manager.nix-darwin ];
    
      environment.systemPackages =
        [ pkgs.vim
        pkgs.tmux
        pkgs.neovim
        pkgs.eza
        ];

      # Necessary for using flakes on this system.
    #   nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
   #   system.configurationRevision = config.rev or config.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    }