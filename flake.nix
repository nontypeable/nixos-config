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

    # Home Manager: Manage user configuration with Nix.
    home-manager.url = "github:nix-community/home-manager";

    # Treefmt Nix: A tool for formatting Nix files.
    treefmt-nix.url = "github:numtide/treefmt-nix";
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

      imports = [
        ./treefmt
      ];

      flake = {
        nixosConfigurations = builtins.mapAttrs libx.mkNixosConfig hosts.devices;
      };
    };
}
