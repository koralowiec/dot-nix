{
  disko.devices = {
    disk = {
      system = {
        type = "disk";
        # device = "/dev/nvme0n1";
        device = "/dev/disk/by-id/ata-INTEL_SSDSCKKF256G8H_BTLA74451LLR256J";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "2G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
		mountOptions = [
                  "defaults"
                ];
              };
            };
            luks = {
              # size = "100%";
              # Based on https://github.com/nix-community/disko/blob/master/example/swap.nix
              end = "-16G";
              content = {
                type = "luks";
                name = "crypted";
                extraOpenArgs = [ ];
                # if you want to use the key for interactive login be sure there is no trailing newline
                # for example use `echo -n "password" > /tmp/secret.key`
                # passwordFile = "/tmp/secret.key";
                passwordFile = "/tmp/secret.key";
                content = {
                  type = "lvm_pv";
                  vg = "pool";
                };
              };
            };
            swap = {
              size = "100%";
              content = {
                type = "swap";
                randomEncryption = true;
                priority = 100; # prefer to encrypt as long as we have space for it
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      pool = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100%FREE";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [
                "defaults"
              ];
            };
          };
          home = {
            size = "64G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
            };
          };
        };
      };
    };
  };
}
