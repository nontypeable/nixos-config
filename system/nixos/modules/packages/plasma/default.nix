{
  lib,
  config,
  services,
  ...
}:

let
  cfg = config.module.packages.plasma;
in
{
  options = {
    module.packages.plasma.enable = lib.mkEnableOption "Module that enables KDE Plasma 6.";
  };

  config = lib.mkIf cfg.enable {
    services = {
      xserver.enable = true;

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
