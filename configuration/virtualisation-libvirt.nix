{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
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

