# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, stylix, ... }:
let
  base16-schemes =
    pkgs.fetchFromGitHub {
      owner = "base16-project";
      repo = "base16-schemes";
      rev = "99529527e7cb3d777fb6e041c2aabbe6cdec4c4c";
      sha256 = "08avs0fykyjl1k3476vhm9rm0hvrpl2hfmc78r3h6yfnjnnl6q66";
    };

in

{
  imports =
    [
      # Include the results of the hardware scan.

      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # networking.networkmanager.enable = true;
  networking.wireless = {
    enable = true;
    networks = {
      "ADDN-20" = {
        psk = "gowest123";
      };

    };

  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.defaultSession = "none+i3";
  #services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.i3 = {
    enable = true;
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "workman";
    xkbOptions = "caps:swapescape,ctrl:swap_lalt_lctl";
    #videoDrivers = ["nvidia"];
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.tapping = true;
  system.autoUpgrade = {
    enable = true;
  };
  virtualisation.docker.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adgai = {
    isNormalUser = true;
    description = "adgai";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      firefox
      kate
      chromium
      vlc
      gpg-tui

      #  thunderbird

    ];
  };
  programs.zsh.promptInit = ''
    any-nix-shell zsh --info-right | source /dev/stdin
  '';

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "adgai";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

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
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 4d";
    };
    package = pkgs.nixFlakes;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # stylix = {
  #   # image = /home/adgai/background-image;
  #   base16Schemes = "${base16-schemes}/tokyo-night-storm.yaml";
  # };
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchDocked = "hibernate";
  };
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
