{ pkgs, ... }:
{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Install driver for Samsung printer
  services.printing.drivers = [ pkgs.splix ];
  # Enable SANE library for scanner support
  hardware.sane.enable = true;

  users.extraGroups = {
    scanner.members = [ "arek" ];
    lp.members = [ "arek" ];
  };
}

