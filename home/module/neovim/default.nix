{
  lib,
  config,
  ...
}:

let
  cfg = config.module.neovim;
in
{
  options = {
    module.neovim.enable = lib.mkEnableOption "Enable neovim.";
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
