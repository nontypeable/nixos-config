{ lib, config, ... }:

let
  cfg = config.module.systemd-boot;
in
{
  options = {
    module.systemd-boot.enable = lib.mkEnableOption "Enable systemd-boot.";
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
