{
  lib,
  config,
  services,
  ...
}:

let
  cfg = config.module.plasma;
in
{
  options = {
    module.plasma.enable = lib.mkEnableOption "Enable KDE Plasma 6.";
  };

  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
      };
    };
  };
}
