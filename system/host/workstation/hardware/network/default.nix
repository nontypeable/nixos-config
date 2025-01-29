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
      allowedTCPPorts = [
        # Syncthing.
        8384
        22000
      ];
      allowedUDPPorts = [
        # WireGuard.
        51820

        # Syncthing.
        22000
        21027
      ];
    };

    useDHCP = lib.mkDefault true;
    hostName = hostname;
  };
}
