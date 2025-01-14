{ self, inputs, ... }:

let
  defaultStateVersion = "25.05";

  # Auxiliary function for creating a host configuration for NixOS.
  generateNixOSHostConfig =
    hostDir:
    {
      username ? "user",
      stateVersion ? defaultStateVersion,
      homeManagerStateVersion ? stateVersion,
      platform ? "x86_64-linux",
      hostname ? hostDir,
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          self
          hostname
          username
          stateVersion
          homeManagerStateVersion
          platform
          hostDir
          ;
      };

      modules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.disko.nixosModules.disko

        "${self}/system/modules"
        "${self}/system"
      ];
    };

in
{
  availableArchitectures = inputs.nixpkgs.lib.systems.flakeExposed;

  generateNixOSHostConfig = builtins.mapAttrs generateNixOSHostConfig;
}
