{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      # OVMF (incl. secure boot variants) is now bundled with qemu and
      # auto-detected by libvirtd; the `ovmf` submodule was removed.
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  users.extraGroups = {
    libvirtd.members = [ "arek" ];
    qemu-libvirtd.members = [ "arek" ];
  };
}

