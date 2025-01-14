{ lib, config, ... }:

let
  cfg = config.module.nix;
in
{
  options = {
    module.nix.enable = lib.mkEnableOption "Module that enables the `nix-command` and `flakes` experimental functions and allows non-free packages to be installed.";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config = {
      allowUnfree = true;
    };

    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
