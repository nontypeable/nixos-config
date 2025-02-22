{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-Samsung_SSD_980_PRO_1TB_S5GXNX1T343557M";
        content = {
          esp = {
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };
          root = {
            size = "900G";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "@" = {
                  mountpoint = "/";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                    "discard=async"
                    "ssd"
                  ];
                };
                "@home" = {
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                    "discard=async"
                    "ssd"
                  ];
                  mountpoint = "/home";
                };
                "@nix" = {
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                    "discard=async"
                    "ssd"
                  ];
                  mountpoint = "/nix";
                };
              };
            };
          };
          swap = {
            size = "8G";
            content = {
              type = "swap";
            };
          };
        };
      };
    };
  };
}
