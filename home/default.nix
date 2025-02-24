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

  rootConfigDirectory = "${self}/home/users/root";
  rootPackagesDirectory = "${rootConfigDirectory}/packages";
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit
        inputs
        self
        ;
    };

    users = {
      ${username} = {
        imports = [
          "${self}/home/module"

          (if builtins.pathExists userConfigDirectory then userConfigDirectory else null)
          (if builtins.pathExists userPackagesDirectory then userPackagesDirectory else null)
        ];

        home.stateVersion = stateVersion;
      };

      root = {
        imports = [
          "${self}/home/module"

          (if builtins.pathExists rootConfigDirectory then rootConfigDirectory else null)
          (if builtins.pathExists rootPackagesDirectory then rootPackagesDirectory else null)
        ];

        home.stateVersion = stateVersion;
      };
    };
  };
}
