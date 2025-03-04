{
  lib,
  config,
  ...
}:

let
  cfg = config.module.thunderbird;
in
{
  options = {
    module.thunderbird.enable = lib.mkEnableOption "Enable Thunderbird.";
  };

  config = lib.mkIf cfg.enable {
    programs.thunderbird = {
      enable = true;
      profiles = {
        "main" = {
          isDefault = true;
          settings = {
            "calendar.alarms.showmissed" = false;
            "calendar.alarms.playsound" = false;
            "calendar.alarms.show" = false;
          };
        };
      };
    };
  };
}
