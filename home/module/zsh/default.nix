{
  lib,
  config,
  ...
}:

let
  cfg = config.module.zsh;
in
{
  options = {
    module.zsh.enable = lib.mkEnableOption "Module that enables zsh.";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "poetry"
          "docker"
          "history"
        ];
        theme = "robbyrussell";
      };

      shellAliases = {
        # System aliases.
        "flake-update" = "nix flake update --flake /etc/nixos";
      };

      initExtra = ''
        export GPG_TTY=$TTY
      '';
    };
  };
}
