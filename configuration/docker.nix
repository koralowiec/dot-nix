{ ... }:
{
  # Configure rootful Docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "arek" ];
}

