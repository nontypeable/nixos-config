{
  lib,
  config,
  ...
}:

let
  cfg = config.module.wireguard;
in
{
  options = {
    module.wireguard.enable = lib.mkEnableOption "Enable Wireguard.";
  };

  config = lib.mkIf cfg.enable {
    boot.kernelModules = [ "wireguard" ];

    networking = {
      wireguard.enable = true;

      firewall = {
        checkReversePath = lib.mkForce false;
        allowedUDPPorts = [ 51820 ];
      };
    };
  };
}
