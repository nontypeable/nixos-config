{
  lib,
  config,
  ...
}:

let
  cfg = config.module.fzf;
in
{
  options = {
    module.fzf.enable = lib.mkEnableOption "Enable fzf.";
  };

  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      defaultOptions = [
        "--border"
      ];

      historyWidgetOptions = [
        "--prompt 'Commands> '"
      ];

      fileWidgetOptions = [
        "--preview 'bat --color=always {}'"
        "--prompt 'Files> '"
      ];
    };
  };
}
