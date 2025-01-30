{
  self,
  lib,
  inputs,
  hostDirectory,
  platform ? null,
  stateVersion ? null,
  ...
}:

let
  hostConfigurationPath = "${self}/system/host/${hostDirectory}";
  hostHardwarePath = "${self}/system/host/${hostDirectory}/hardware";
in
{
  imports =
    [ ]
    ++ lib.optional (builtins.pathExists hostConfigurationPath) hostConfigurationPath
    ++ lib.optional (builtins.pathExists hostHardwarePath) hostHardwarePath;

  system = { inherit stateVersion; };
  nixpkgs = {
    hostPlatform = platform;
  };
}
