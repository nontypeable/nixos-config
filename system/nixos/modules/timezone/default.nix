{
  lib,
  config,
  ...
}:

let
  cfg = config.module.timezone;
in
{
  options = {
    module.timezone.enable = lib.mkEnableOption "Module that enables timezone and time synchronization.";
  };

  config = lib.mkIf cfg.enable {
    time.timeZone = "Europe/Moscow";
    services.chrony.enable = true;
  };
}
