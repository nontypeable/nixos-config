{
  self,
  pkgs,
  lib,
  inputs,
  username,
  homeManagerStateVersion,
  ...
}:

let
  stateVersion = homeManagerStateVersion;
  homeDirectory = if username == "root" then "/root" else "/home/${username}";
  userConfigPath = "${self}/home/users/${username}";
  userModulesPath = "${self}/home/users/${username}/modules";
  timestamp = pkgs.runCommand "timestamp" { } ''
    echo -n $(date '+%Y%m%d%H%M%S') > $out
  '';
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup-" + pkgs.lib.readFile timestamp;

    extraSpecialArgs = {
      inherit
        inputs
        self
        username
        stateVersion
        ;
    };

    users.${username} = {
      imports = [
        "${self}/home/modules"
        (if builtins.pathExists userConfigPath then userConfigPath else null)
        (if builtins.pathExists userModulesPath then userModulesPath else null)
      ];

      home = {
        inherit username stateVersion homeDirectory;
      };
    };
  };
}
