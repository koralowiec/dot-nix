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

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, catppuccin, home-manager, kolide-launcher, nixos-cosmic, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # PC
      microwave = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration/specific/microwave.nix

          ./configuration/audio.nix
          ./configuration/bluetooth.nix
          ./configuration/ddcutil.nix
          ./configuration/doc-man.nix
          ./configuration/docker.nix
          ./configuration/flatpak.nix
          ./configuration/font.nix
          ./configuration/gnome.nix
          ./configuration/i3.nix
          ./configuration/locals.nix
          ./configuration/networking.nix
          ./configuration/nix-conf.nix
          ./configuration/nixpkgs-config.nix
          ./configuration/printer.nix
          ./configuration/steam.nix
          ./configuration/user-arek.nix
          ./configuration/virtualisation-libvirt.nix
          ./configuration/xbox-adapter.nix
          
          ./hardware-configuration/microwave.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.arek = {
              imports = [
                ./home-manager/specific/microwave.nix
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
	  ./configuration/cosmic.nix
          ./configuration/doc-man.nix
          ./configuration/docker.nix
          ./configuration/font.nix
          # ./configuration/gnome.nix
          # (import ./configuration/kolide.nix { inherit inputs; })
          ./configuration/laptop.nix
          ./configuration/locals.nix
          ./configuration/networking.nix
          ./configuration/nix-conf.nix
          ./configuration/nixpkgs-config.nix
          ./configuration/printer.nix
          ./configuration/sshd.nix
          ./configuration/sway.nix
          ./configuration/user-arek.nix
          ./configuration/user-arik.nix
	  ./configuration/virtualisation-libvirt.nix

          ./hardware-configuration/toaster.nix

          inputs.disko.nixosModules.disko
          ./disko/toaster.nix

	  {
            # https://github.com/lilyinstarlight/nixos-cosmic?tab=readme-ov-file#flakes
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
          }
          nixos-cosmic.nixosModules.default

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
