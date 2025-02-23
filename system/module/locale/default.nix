{
  lib,
  config,
  ...
}:

let
  cfg = config.module.locale;
in
{
  options = {
    module.locale.enable = lib.mkEnableOption "Enable locale configuration.";
  };

  config = lib.mkIf cfg.enable {
    i18n = {
      defaultLocale = "ru_RU.UTF-8";
      supportedLocales = [
        "en_US.UTF-8/UTF-8"
        "ru_RU.UTF-8/UTF-8"
      ];
    };

    environment.variables = {
      LC_TIME = "ru_RU.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_MESSAGES = "en_US.UTF-8";
    };
  };
}
