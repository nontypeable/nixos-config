{
  self,
  lib,
  deviceDirectory,
  ...
}:

let
  deviceHardwareFixesPath = "${self}/system/device/${deviceDirectory}/hardware/fixes";
in
{
  imports = builtins.filter lib.pathIsDirectory (
    map (module: "${deviceHardwareFixesPath}/${module}") (
      builtins.attrNames (builtins.readDir deviceHardwareFixesPath)
    )
  );
}
