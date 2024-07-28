# Configuration for virtualization

{ config, lib, pkgs, ... }: { 
  home.packages = [
    pkgs.virt-manager
    pkgs.xorriso
  ]; 
}
