{
  self,
  lib,
  username,
  ...
}:

let
  userModules = "${self}/home/users/${username}/modules";
in
{
  imports = builtins.filter lib.pathIsDirectory (
    builtins.map (module: "${userModules}/${module}") (
      builtins.attrNames (builtins.readDir userModules)
    )
  );
}
