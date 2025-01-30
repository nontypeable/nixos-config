{
  lib,
  config,
  ...
}:

let
  cfg = config.module.firefox;
in
{
  options = {
    module.firefox.enable = lib.mkEnableOption "Module that enables the Firefox web browser.";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
