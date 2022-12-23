{ pkgs
, ...
}: {

  networking.hostName = "nixos"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  system.autoUpgrade = {
    enable = true;
  };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adgai = {
    isNormalUser = true;
    description = "adgai";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      # firefox
      latest.firefox-nightly-bin
      networkmanager
      kate
      chromium
      vlc
      gpg-tui

      #  thunderbird

    ];
  };

  virtualisation.docker.enable = true;

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "adgai" ];

  programs.zsh.promptInit = ''
    any-nix-shell zsh --info-right | source /dev/stdin
  '';

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "adgai";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebkit-5.212.0-alpha4"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pinentry-curses
    git
    rofi
    niv
    any-nix-shell
    pamixer
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    xorg.xmodmap
  ];
  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "qt";
  };
  services.picom.enable = true;
  fonts.fonts = with pkgs;[ fira-code fira-code-symbols font-awesome ];


  security.sudo.wheelNeedsPassword = false;
  # List services that you want to enable:

  nix = {
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    ''; # substituters = "https://danth.cachix.org";
    # trusted-public-keys = "danth.cachix.org-1:wpodfSL7suXRc/rJDZZUptMa1t4MJ795hemRN0q84vI=";

    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "adgai" ];

      extra-substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];

      extra-trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="

      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 4d";
    };
    package = pkgs.nixVersions.stable;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  system.stateVersion = "22.05"; # Did you read the comment?
}
