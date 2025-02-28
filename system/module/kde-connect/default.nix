{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.module.kde-connect;
in
{
  options = {
    module.kde-connect.enable = lib.mkEnableOption "Enable KDE Connect.";
  };

  config = lib.mkIf cfg.enable {
    programs.kdeconnect.enable = true;

    networking.firewall = rec {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
