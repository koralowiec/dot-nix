{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    kolide-launcher = {
      url = "github:/kolide/nix-agent/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, catppuccin, home-manager, kolide-launcher, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # PC
      microwave = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.arek = {
              imports = [
                ./home-manager/home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }

          catppuccin.nixosModules.catppuccin
        ];
      };

      # ThinkPad
      toaster = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./configuration/boot-systemd.nix
          ./configuration/specific/toaster.nix 

          ./configuration/audio.nix
          ./configuration/bluetooth.nix
          ./configuration/doc-man.nix
          ./configuration/docker.nix
          ./configuration/font.nix
          ./configuration/gnome.nix
          # (import ./configuration/kolide.nix { inherit inputs; })
          ./configuration/laptop.nix
          ./configuration/locals.nix
          ./configuration/networking.nix
          ./configuration/nix-conf.nix
          ./configuration/nixpkgs-config.nix
          ./configuration/printer.nix
          ./configuration/sshd.nix
          ./configuration/user-arek.nix
          ./configuration/user-arik.nix

          ./hardware-configuration/toaster.nix

          inputs.disko.nixosModules.disko
          ./disko/toaster.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.arek = {
              imports = [
                ./home-manager/specific/toaster.nix

                catppuccin.homeManagerModules.catppuccin
              ];
            };

            home-manager.users.arik = {
              imports = [
                ./home-manager/specific/toaster-work.nix

                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }

          catppuccin.nixosModules.catppuccin
	  kolide-launcher.nixosModules.kolide-launcher
        ];
      };
    };
  };
}
