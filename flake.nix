{
  description = "nontypeable's flake";

  inputs = {
    # -- nixpkgs --

    # Latest versions of Nixpkgs from the master branch (extremely unstable).
    master = {
      url = "github:NixOS/nixpkgs/master";
    };

    # Unstable Nixpkgs branch (frequent updates, possible bugs).
    unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    # Stable Nixpkgs branch (less frequent updates, more stability).
    stable = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };

    # Current branch of Nixpkgs.
    nixpkgs = {
      follows = "stable";
    };

    # -- nix-community --

    # Home Manager: Manage user configuration with Nix.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Disko: A tool for managing disk partitions using Nix.
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flake Parts: A tool for managing reusable components in Nix flakes.
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # Treefmt Nix: A tool for formatting Nix code to a consistent style.
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
    };
  };

  outputs =
    { self, ... }@inputs:
    let
      # Hosts description.
      hosts = import ./hosts.nix;
    in
    { };
}
