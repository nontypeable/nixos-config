{ lib
, config
, ...
}:

with lib;

let
  cfg = config.module.bluetooth;
in {
  options = {
    module.bluetooth = {
      enable = mkEnableOption "Module that enables Bluetooth.";
    };
  };

  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}

