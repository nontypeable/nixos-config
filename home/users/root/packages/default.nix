{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.module.root.packages;
in
{
  options.module.root.packages = {
    enable = lib.mkEnableOption "Enable root packages.";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # Security & Monitoring.
      sysstat
      iotop
      lm_sensors
      smartmontools

      # Networking.
      nmap
      tcpdump
      mtr
      whois
      speedtest-cli

      # Hardware Inspection.
      usbutils
      pciutils
    ];
  };
}
