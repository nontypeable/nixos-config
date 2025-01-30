{ self, lib, ... }:

let
  servicesDir = "${self}/home/modules/services";
in
{
  imports = builtins.filter (module: lib.pathIsDirectory module) (
    map (name: "${servicesDir}/${name}") (builtins.attrNames (builtins.readDir servicesDir))
  );
}