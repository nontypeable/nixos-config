{
  lib,
  config,
  username,
  pkgs,
  ...
}:

let
  cfg = config.module.virtualization;
in
{
  options = {
    module.virtualization.enable = lib.mkEnableOption "Module that enables virtualization.";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      virt-manager
    ];

    users.groups = {
      libvirtd.members = [ username ];
    };

    virtualisation = {
      docker.enable = true;
      libvirtd.enable = true;
    };
  };
}
