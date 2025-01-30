{
  lib,
  config,
  ...
}:

let
  cfg = config.module.packages.zsh;
in
{
  options = {
    module.packages.zsh.enable = lib.mkEnableOption "Module that enables zsh.";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.enable = true;
  };
}
