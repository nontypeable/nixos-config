{
  self,
  lib,
  deviceDirectory,
  ...
}:

let
  deviceHardwareDirectory = "${self}/system/device/${deviceDirectory}/hardware";
in
{
  imports = builtins.filter lib.pathIsDirectory (
    map (module: "${deviceHardwareDirectory}/${module}") (
      builtins.attrNames (builtins.readDir deviceHardwareDirectory)
    )
  );
}
