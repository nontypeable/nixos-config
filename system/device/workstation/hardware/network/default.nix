{ lib, deviceDirectory, ... }:

{
  systemd.network.enable = false;

  networking = {
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
      checkReversePath = true;
    };

    useDHCP = lib.mkDefault true;
    hostName = deviceDirectory;
  };
}
