{ pkgs, ... }: {
      environment.systemPackages =
        [ pkgs.vim
        pkgs.tmux
        pkgs.eza
        ];

        users.users.adgai = {
          home = "/Users/adgai";
          shell = pkgs.zsh;
        };

        programs.zsh = {
          enable = true;
          enableCompletion = false;
          enableBashCompletion = false;
          promptInit = "";
        };

 nix = {
  optimise.automatic = true;
    settings = {
      builders-use-substitutes = true;
      experimental-features = ["flakes" "nix-command"];
      substituters = ["https://nix-community.cachix.org"];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = ["@wheel"];
      warn-dirty = false;
    };
  };

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      nixpkgs.config.allowUnfree = true;
    }
