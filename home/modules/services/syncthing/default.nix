{ config, pkgs, username, lib, ... }:

let
  cfg = config.module.services.syncthing;
in {
  options = {
    module.services.syncthing.enable = lib.mkEnableOption "Module that enables Syncthing user service.";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
    };
  };
}