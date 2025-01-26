{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.module.packages.systemPackages;
in
{
  options = {
    module.packages.systemPackages.enable = lib.mkEnableOption "Module that installs system-wide packages.";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # Utils
      git
      curl
      neovim
      wget
      tree
      file
      zip
      unzip
      killall
      nix-output-monitor
      openssl
      libgcc
      gcc
      brightnessctl

      # Hardware
      microcode-amd
      glxinfo
      lm_sensors

      # Network
      wireguard-tools
      inetutils
      nmap
      dnsutils
    ];
  };
}
