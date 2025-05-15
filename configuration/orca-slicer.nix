{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ orca-slicer ];

  # Allow traffic for LAN only mode
  # https://wiki.bambulab.com/en/general/printer-network-ports
  networking.firewall = {
    allowedTCPPorts = [ 8883 990 322 6000 ];
    allowedUDPPorts = [ 2021 1990 ];
    
    allowedTCPPortRanges = [
      { from = 50000; to = 50100; }
    ];
  };

}

