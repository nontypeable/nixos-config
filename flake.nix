{
  description = "nontypeable's flake";

  inputs = {
    # Stable Nixpkgs branch (less frequent updates, more stability).
    stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Unstable Nixpkgs branch (frequent updates, possible bugs).
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Flake Parts: A tool for managing reusable components in Nix flakes.
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Disko: A tool for managing disk partitions using Nix.
    disko.url = "github:nix-community/disko";
  };

  outputs =
    { self, flake-parts, ... }@inputs:
    let
      # Hosts description.
      hosts = import ./hosts.nix;

      # Auxiliary code.
      libx = import ./lib { inherit self inputs; };

      # All flake-supported systems.
      supportedSystems = libx.allSupportedSystems hosts.devices;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = supportedSystems;

      flake = {
        nixosConfigurations = builtins.mapAttrs libx.mkNixosConfig hosts.devices;
      };
    };
}
