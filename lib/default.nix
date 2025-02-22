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
    };
in
{
  inherit mkNixosConfig;
}
