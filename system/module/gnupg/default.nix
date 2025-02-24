{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.module.gnupg;
in
{
  options = {
    module.gnupg.enable = lib.mkEnableOption "Enable GnuPG.";
  };

  config = lib.mkIf cfg.enable {
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = lib.mkForce pkgs.pinentry-curses;
    };
  };
}
