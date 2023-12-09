# Configuration for syncthing

{ config, lib, pkgs, ... }:
{ 
  services.syncthing = {
    enable = true;
  };
}
