{ self, inputs, ... }:

let
  defaultStateVersion = "25.05";

  # Auxiliary function for creating a host configuration for NixOS.
  generateNixOSHostConfig =
    hostDirectory:
    {
      username ? "user",
      stateVersion ? defaultStateVersion,
      homeManagerStateVersion ? stateVersion,
      platform ? "x86_64-linux",
      hostname ? hostDirectory,
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
          hostDirectory
          ;
      };

      modules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.disko.nixosModules.disko

        "${self}/system/nixos/modules"
        "${self}/system"
        "${self}/home"
      ];
    };

in
{
  availableArchitectures = inputs.nixpkgs.lib.systems.flakeExposed;

  generateNixOSHostConfig = builtins.mapAttrs generateNixOSHostConfig;
}
