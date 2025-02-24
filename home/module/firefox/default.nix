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
    module.firefox.enable = lib.mkEnableOption "Enable Firefox.";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
