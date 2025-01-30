{
  self,
  lib,
  ...
}:

let
  packagesModulesPath = "${self}/system/nixos/modules/packages";
in
{
  imports = builtins.filter lib.pathIsDirectory (
    map (module: "${packagesModulesPath}/${module}") (
      builtins.attrNames (builtins.readDir packagesModulesPath)
    )
  );
}
