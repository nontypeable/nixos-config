{ self, lib, ... }:

let
  systemModules = "${self}/system/module";
in
{
  imports = builtins.filter lib.pathIsDirectory (
    map (name: "${systemModules}/${name}") (builtins.attrNames (builtins.readDir systemModules))
  );
}
