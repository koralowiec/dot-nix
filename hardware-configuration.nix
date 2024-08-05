# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a489e9d3-9030-49df-b1ec-bab91c5b9b0f";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-54f21000-18ff-4548-9841-f38dd201a63a".device = "/dev/disk/by-uuid/54f21000-18ff-4548-9841-f38dd201a63a";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8B73-F16A";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/b71eab2e-00f2-40e3-87c8-2467393186fe"; }
    ];

  fileSystems."/mnt/sda1" =
    { device = "/dev/disk/by-uuid/8e3bc4ac-17d1-4eb7-bc32-cc59f97b01cd";
      fsType = "ext4";
    };

  fileSystems."/mnt/sdb1" =
    { device = "/dev/disk/by-uuid/18fda96d-43af-4b9a-9f68-e84390790111";
      fsType = "ext4";
    };


  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}