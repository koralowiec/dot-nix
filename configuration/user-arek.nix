{ ... }:
{
  # My user
  users.users.arek = {
    isNormalUser = true;
    description = "arek";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}

