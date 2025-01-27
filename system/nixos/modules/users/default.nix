{
  self,
  pkgs,
  lib,
  config,
  username,
  ...
}:

let
  cfg = config.module.users;
in
{
  options = {
    module.users.enable = lib.mkEnableOption "Module that enables users in the system.";
  };

  config = lib.mkIf cfg.enable {
    users = {
      mutableUsers = true;

      groups = {
        ${username} = {
          gid = 1000;
        };
      };

      users = {
        ${username} = {
          uid = 1000;
          home = "/home/${username}";
          createHome = true;
          shell = pkgs.zsh;
          group = "${username}";
          isNormalUser = true;

          extraGroups = [
            "wheel"
            "audio"
            "input"
            "networkmanager"
            "git"
            "docker"
          ];
        };

        root = {
          shell = pkgs.bash;
        };
      };
    };
  };
}
