{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.module.syncthing;
in
{
  options = {
    module.syncthing.enable = lib.mkEnableOption "Enable Syncthing.";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      tray = {
        enable = true;
        command = "syncthingtray --wait";
        package = pkgs.syncthingtray-minimal;
      };
    };
  };
}
