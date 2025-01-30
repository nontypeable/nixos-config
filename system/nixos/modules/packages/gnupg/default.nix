{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.module.packages.gnupg;
in
{
  options = {
    module.packages.gnupg.enable = lib.mkEnableOption "Module that enables GnuPG.";
  };

  config = lib.mkIf cfg.enable {
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = lib.mkForce pkgs.pinentry-curses;
    };
  };
}
