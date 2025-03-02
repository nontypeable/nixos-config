{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.module.andrey.packages;
in
{
  options.module.andrey.packages = {
    enable = lib.mkEnableOption "Enable user packages.";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # Utils.
      bat
      brightnessctl
      shellcheck
      typos
      wl-clipboard
      xdg-utils

      # Development.
      clang
      clang-tools
      go
      mypy
      nixfmt-rfc-style
      nodejs
      nodePackages.prettier
      black
      python3

      # Media.
      ffmpeg
      obs-studio
      spotify
      vlc

      # Chats.
      telegram-desktop
      vesktop

      # Productivity.
      obsidian
    ];
  };
}
