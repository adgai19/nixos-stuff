# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ../commons/config.nix

      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.enable = true;

  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager.i3 = {
    enable = true;
  };

  services.xserver = {
    layout = "us";
#    videoDrivers = [ "nvidia" ];
  };

  hardware.opengl.enable = true;
  hardware.pulseaudio.enable = false;
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput = {
    enable = true;
    touchpad.tapping = true;
    mouse = {
      scrollButton = 7;
      scrollMethod = "button";
      horizontalScrolling = false;
    };
  };

  services.xserver.dpi = 96;

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchDocked = "suspend";
  };

  services.printing.drivers = [ pkgs.epson-escpr ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.pcscd.enable = true;
  services.blueman.enable = true;
  services.tailscale.enable = true;
  # for qmk and yubikey
  services.udev.packages = [ pkgs.qmk-udev-rules pkgs.yubikey-personalization ];
  environment.enableAllTerminfo = true;

  networking.hostName = "old"; # Define your hostname
  networking.networkmanager.enable = true;
  networking.networkmanager.unmanaged = [ "wlp0s20f3" ];

  networking.nameservers = [ "172.20.0.165" "1.1.1.1" ];
  networking.wireless = {
    enable = true;
    networks = {
      "ADDN-20" = {
        pskRaw = "ac67aa719a92f7b3ca8a4cf388825c0c4123a036d6531fc2f18755623ab2a847";
      };
    };
  };

  # networking.search = [ "daggertooth-bangus.ts.net" ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8802 ];
  networking.firewall.allowedUDPPorts = [ 8802 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
  systemd.services.NetworkManager-wait-online.enable = false;
}
