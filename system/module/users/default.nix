{
  lib,
  config,
  pkgs,
  username,
  ...
}:

let
  cfg = config.module.users;
  uid = 1000;
  gid = 1000;
in
{
  options = {
    module.users.enable = lib.mkEnableOption "Enable user configuration.";
  };

  config = lib.mkIf cfg.enable {
    users = {
      mutableUsers = true;

      groups = {
        "${username}" = {
          gid = 1000;
        };
      };

      users = {
        "${username}" = {
          uid = uid;
          home = "/home/${username}";
          createHome = true;
          shell = pkgs.bash;
          group = "${username}";
          isNormalUser = true;

          extraGroups = [
            "wheel"
            "audio"
            "input"
            "networkmanager"
          ];
        };

        root = {
          shell = pkgs.bash;
        };
      };
    };
  };
}
