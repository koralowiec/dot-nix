{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, catppuccin, nixpkgs, ... }@inputs: {
    nixosConfigurations.microwave = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        catppuccin.nixosModules.catppuccin
      ];
    };
    catppuccin.enable = true;
  };
}
