{
  lib,
  config,
  username,
  pkgs,
  ...
}:

let
  cfg = config.module.virtualization;
in
{
  options = {
    module.virtualization.enable = lib.mkEnableOption "Module that enables virtualization.";
  };

  config = lib.mkIf cfg.enable {
    virtualisation = {
      docker.enable = true;
    };
  };
}
