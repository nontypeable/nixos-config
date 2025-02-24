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
    module.timezone.enable = lib.mkEnableOption "Enable timezone and time synchronization configuration.";
  };

  config = lib.mkIf cfg.enable {
    time.timeZone = "Europe/Moscow";
    services.chrony.enable = true;
  };
}
