{ self, inputs }:
let
  mkNixosConfig =
    deviceDirectory:
    {
      platform ? "x86_64-linux",
      repository ? "stable",
      stateVersion,
    }:
    inputs.${repository}.lib.nixosSystem {
      system = platform;
      specialArgs = {
        inherit
          inputs
          self
          deviceDirectory
          platform
          stateVersion
          ;
      };

      modules = [ ];
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
