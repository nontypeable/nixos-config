{
  lib,
  config,
  services,
  ...
}:

let
  cfg = config.module.packages.steam;
in
{
  options = {
    module.packages.steam.enable = lib.mkEnableOption "Module that enables Steam.";
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
