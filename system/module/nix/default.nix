{ lib, config, ... }:

let
  cfg = config.module.nix;
in
{
  options = {
    module.nix.enable = lib.mkEnableOption "Enable nix configuration.";
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
        auto-optimise-store = true;
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
      };
    };
  };
}
