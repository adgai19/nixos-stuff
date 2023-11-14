{ pkgs, ... }: {
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  system.autoUpgrade = {
    enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    TERMINFO_DIRS = "/home/adgai/.nix-profile/share/terminfo";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adgai = {
    isNormalUser = true;
    description = "adgai";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
    packages = with pkgs; [
      # latest.firefox-nightly-bin
      networkmanager
      firefox
      kate
      chromium
      vlc
      gpg-tui
    ];
  };

  virtualisation.docker.enable = true;
  programs.dconf.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "adgai" ];

  virtualisation.libvirtd.enable = true;
  users.extraUsers.adgai.extraGroups = [ "libvirtd" ];

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
    git
    niv
    pamixer
    pinentry-curses
    rofi
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    virt-manager
    wget
    xorg.xmodmap
    # yubioath-flutter
  ];
  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "qt";
  };
  services.picom.enable = true;
  fonts.fonts = with pkgs;[ fira-code fira-code-symbols font-awesome customFonts.Lilix ];


  security.sudo.wheelNeedsPassword = false;
  # List services that you want to enable:

  nix = {

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

  services.cachix-agent.enable = true;

  system.stateVersion = "22.05";
}

