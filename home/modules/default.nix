{
  self,
  lib,
  ...
}:

let
  homeModulesPath = "${self}/home/modules";
in
{
  imports = builtins.filter lib.pathIsDirectory (
    map (module: "${homeModulesPath}/${module}") (builtins.attrNames (builtins.readDir homeModulesPath))
  );
}
