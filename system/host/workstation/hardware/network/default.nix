{ lib, hostname, ... }:

{
  systemd.network.enable = false;

  networking = {
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
    };

    useDHCP = lib.mkDefault true;
    hostName = hostname;
  };
}
