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
      jetbrains-toolbox
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
      vlc

      # Desktop Integration Utilities.
      xdg-utils
      wl-clipboard
      brightnessctl
    ];
  };
}
