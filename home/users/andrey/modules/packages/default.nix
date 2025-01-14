{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.module.user.packages;
in
{
  options.module.user.packages = {
    enable = lib.mkEnableOption "Module that installs user packages.";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      # Utils.
      bat
      ffmpeg
      tokei
      obsidian

      # Programming.
      go
      python3
      nodejs
      shellcheck
      pre-commit
      deadnix
      statix

      # DevOps Utils.
      docker-compose

      # Chats.
      telegram-desktop
      discord

      # Misc.
      obs-studio
      vlc

      # Desktop Integration Utilities.
      xdg-utils
      wl-clipboard
      brightnessctl
    ];
  };
}
