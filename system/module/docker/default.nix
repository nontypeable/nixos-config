{
  lib,
  config,
  username,
  pkgs,
  ...
}:

let
  cfg = config.module.docker;
in
{
  options = {
    module.docker.enable = lib.mkEnableOption "Enable Docker.";
  };

  config = lib.mkIf cfg.enable {
    users.groups = {
      docker.members = [ username ];
    };

    virtualisation = {
      docker.enable = true;
    };
  };
}
