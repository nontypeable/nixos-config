{
  self,
  lib,
  ...
}:

let
  homeModulesPath = "${self}/home/module";
in
{
  imports = builtins.filter lib.pathIsDirectory (
    map (module: "${homeModulesPath}/${module}") (builtins.attrNames (builtins.readDir homeModulesPath))
  );
}
