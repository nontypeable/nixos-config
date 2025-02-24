{
  self,
  inputs,
  username,
  stateVersion,
  ...
}:
let
  userConfigDirectory = "${self}/home/users/${username}";
  userPackagesDirectory = "${userConfigDirectory}/packages";
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users = {
      ${username} = {
        imports = [
          (if builtins.pathExists userConfigDirectory then userConfigDirectory else null)
          (if builtins.pathExists userPackagesDirectory then userPackagesDirectory else null)
        ];

        home.stateVersion = stateVersion;
      };
    };
  };
}
