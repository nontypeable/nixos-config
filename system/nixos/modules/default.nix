{ self, lib, ... }:

let
  systemModules = "${self}/system/nixos/modules";
in
{
  imports = builtins.filter (module: lib.pathIsDirectory module) (
    map (module: "${systemModules}/${module}") (builtins.attrNames (builtins.readDir systemModules))
  );
}
