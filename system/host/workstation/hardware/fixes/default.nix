{
  self,
  lib,
  hostDirectory,
  ...
}:

let
  hostHardwareFixesPath = "${self}/system/host/${hostDirectory}/hardware/fixes";
in
{
  imports = builtins.filter lib.pathIsDirectory (
    map (module: "${hostHardwareFixesPath}/${module}") (
      builtins.attrNames (builtins.readDir hostHardwareFixesPath)
    )
  );
}
