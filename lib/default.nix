{ self, inputs }:
let
  allowedRepositories = [
    "stable"
    "unstable"
  ];

  assertValidRepository =
    repository:
    if builtins.elem repository allowedRepositories then
      repository
    else
      throw "Error: repository '${repository}' is not allowed. Allowed values: ${builtins.concatStringsSep ", " allowedRepositories}";

  mkNixosConfig =
    deviceDirectory:
    {
      username ? "user",
      platform ? "x86_64-linux",
      repository ? "stable",
      stateVersion,
    }:
    let
      validRepository = assertValidRepository repository;
    in
    inputs.${validRepository}.lib.nixosSystem {
      system = platform;
      specialArgs = {
        inherit
          inputs
          self
          deviceDirectory
          username
          platform
          stateVersion
          ;
      };

      modules = [
        inputs.disko.nixosModules.disko
        inputs.home-manager.nixosModules.home-manager

        "${self}/system"
        "${self}/system/module"
        "${self}/home"
      ];
    };

  getAllSupportedSystems =
    hosts:
    builtins.sort builtins.lessThan (
      builtins.attrNames (
        builtins.listToAttrs (
          map
            (x: {
              name = x;
              value = null;
            })
            (
              builtins.concatLists (
                map (name: inputs.${hosts.${name}.repository}.lib.systems.flakeExposed or [ ]) (
                  builtins.attrNames hosts
                )
              )
            )
        )
      )
    );
in
{
  allSupportedSystems = getAllSupportedSystems;
  inherit mkNixosConfig;
}
