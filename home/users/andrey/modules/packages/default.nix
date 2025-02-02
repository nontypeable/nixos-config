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
      # Formatters.
      deadnix
      statix
      nixfmt-rfc-style

      # Utils.
      bat
      ffmpeg
      tokei
      obsidian
      jq
      typos

      # Programming.
      go
      python3
      nodejs
      shellcheck
      pre-commit
      deadnix
      statix
      vscode
      postman

      # DevOps Utils.
      docker-compose

      # Chats.
      telegram-desktop

      # Misc.
      obs-studio
      chromium
      spotify
      bitwarden
      libreoffice
      vlc

      # Desktop Integration Utilities.
      xdg-utils
      wl-clipboard
      brightnessctl
    ];
  };
}
