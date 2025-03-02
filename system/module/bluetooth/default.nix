{
  lib,
  config,
  ...
}:

let
  cfg = config.module.bluetooth;
in
{
  options = {
    module.bluetooth = {
      enable = lib.mkEnableOption "Enable Bluetooth.";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
