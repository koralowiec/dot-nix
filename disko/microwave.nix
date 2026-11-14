{
  disko.devices = {
    disk = {
      system = {
        type = "disk";
        # TODO: replace with the stable path of the target NVMe drive
        # (`ls -l /dev/disk/by-id/ | grep nvme`). Plain /dev/nvme0n1 can change
        # between boots, and the wrong disk gets wiped.
        device = "/dev/nvme0n1";
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
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              # Leaves the last 16G for the swap partition below.
              # Based on https://github.com/nix-community/disko/blob/master/example/swap.nix
              end = "-16G";
              content = {
                type = "luks";
                name = "crypted";
                extraOpenArgs = [ ];
                # Only read at install time (disko-install / disko --mode format).
                # No trailing newline, e.g. `echo -n "password" > /tmp/secret.key`
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
                # Re-encrypted with a random key on every boot, so no
                # hibernation.
                randomEncryption = true;
                priority = 100;
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
              mountOptions = [ "defaults" ];
            };
          };
          # Separate LV so / can be reinstalled without touching /home.
          home = {
            size = "200G";
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
