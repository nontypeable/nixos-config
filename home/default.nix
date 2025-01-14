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
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

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
      ];

      home = {
        inherit username stateVersion homeDirectory;
      };
    };
  };
}
