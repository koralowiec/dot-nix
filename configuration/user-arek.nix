{ ... }:
{
  # My user
  users.users.arek = {
    isNormalUser = true;
    description = "arek";
    extraGroups = [
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      firefox
    ];
  };
}

