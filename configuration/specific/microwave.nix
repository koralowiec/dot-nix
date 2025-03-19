{ config, pkgs, ... }:
{
  imports = [ ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  # The latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Define your hostname
  networking.hostName = "microwave";

  # Disable IPv6
  networking.enableIPv6 = false;
  boot.kernelParams = ["ipv6.disable=1"];

  # Configure video drivers for X server
  services.xserver.videoDrivers = [ "amdgpu" ];
  # Configure dedicated GPU as the first Device section for X server
  services.xserver.deviceSection = ''
    BusID "PCI:3:0:0"
  '';

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    neovim
  ];

  # Fix for audio crackling
  # https://discourse.nixos.org/t/strange-audio-issues-after-updating/57098/7
  services.pipewire = {
    extraConfig.pipewire = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 2048;
        "default.clock.min-quantum" = 2048;
        "default.clock.max-quantum" = 8192;
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
