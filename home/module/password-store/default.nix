{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.module.password-store;
in
{
  options = {
    module.password-store.enable = lib.mkEnableOption "Enable password-store.";
  };

  config = lib.mkIf cfg.enable {
    programs.password-store = {
      enable = true;

      settings = {
        PASSWORD_STORE_DIR = "$HOME/.password-store";
      };

      package = pkgs.pass-wayland.withExtensions (exts: [ exts.pass-update ]);
    };
  };
}
