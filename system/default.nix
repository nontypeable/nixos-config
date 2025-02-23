{
  self,
  lib,
  inputs,
  deviceDirectory,
  platform,
  stateVersion,
  ...
}:

let
  deviceConfigurationDirectory = "${self}/system/device/${deviceDirectory}";
  deviceHardwareDirectory = "${deviceConfigurationDirectory}/hardware";

  configExists = builtins.pathExists deviceConfigurationDirectory;
  hardwareExists = builtins.pathExists deviceHardwareDirectory;
in
{
  imports = lib.concatLists [
    (lib.optional configExists deviceConfigurationDirectory)
    (lib.optional hardwareExists deviceHardwareDirectory)
  ];

  system = { inherit stateVersion; };
  nixpkgs.hostPlatform = platform;
}
