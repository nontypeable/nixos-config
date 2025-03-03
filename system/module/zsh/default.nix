{ lib, config, ... }:

let
  cfg = config.module.zsh;
in
{
  options = {
    module.zsh.enable = lib.mkEnableOption "Enable zsh.";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.enable = true;
  };
}
