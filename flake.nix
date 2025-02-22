{
  description = "nontypeable's flake";

  inputs = {
    # Stable Nixpkgs branch (less frequent updates, more stability).
    stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Unstable Nixpkgs branch (frequent updates, possible bugs).
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, ... }@inputs:
    let
      # Hosts description.
      hosts = import ./hosts.nix;
    in
    { };
}
