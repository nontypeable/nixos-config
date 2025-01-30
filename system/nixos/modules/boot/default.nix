{ lib, config, ... }:

let
  cfg = config.module.boot;
in
{
  options = {
    module.boot.enable = lib.mkEnableOption "Module that enables the bootloader.";
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
