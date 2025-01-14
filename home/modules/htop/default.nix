{
  lib,
  config,
  ...
}:

let
  cfg = config.module.htop;
in
{
  options = {
    module.htop.enable = lib.mkEnableOption "Module that enables htop.";
  };

  config = lib.mkIf cfg.enable {
    programs.htop = {
      enable = true;
    };
  };
}
