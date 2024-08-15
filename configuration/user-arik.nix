{ ... }:
{
  # My user
  users.users.arik = {
    isNormalUser = true;
    description = "arik";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}

