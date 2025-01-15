{ lib, hostname, ... }:

{
  systemd.network.enable = false;

  networking = {
    networkmanager = {
      enable = true;
    };

    wireguard = {
      enable = true;
    };

    firewall = {
      enable = true;
      checkReversePath = false; 
      allowedUDPPorts = [
        51820 # WireGuard
      ];
    };

    useDHCP = lib.mkDefault true;
    hostName = hostname;
  };
}
