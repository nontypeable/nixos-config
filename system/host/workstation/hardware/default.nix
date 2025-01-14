{
  self,
  lib,
  hostDirectory,
  ...
}:

let
  hostHardwarePath = "${self}/system/host/${hostDirectory}/hardware";
in
{
  imports = builtins.filter lib.pathIsDirectory (
    map (module: "${hostHardwarePath}/${module}") (
      builtins.attrNames (builtins.readDir hostHardwarePath)
    )
  );
}
