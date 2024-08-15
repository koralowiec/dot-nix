# Configuration for Kubernetes related tools

{ config, lib, pkgs, ... }:
let
  # Unstable for tmuxPlugins.catppuccin
  # Solution from
  # https://discourse.nixos.org/t/installing-only-a-single-package-from-unstable/5598/2
  # unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{ 
  home.packages = with pkgs; [
    kind
    kubectl
    kubectl-example
    kubectl-explore
  ]; 
}
