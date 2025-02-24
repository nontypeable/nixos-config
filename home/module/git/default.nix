{
  lib,
  config,
  ...
}:

let
  cfg = config.module.git;
in
{
  options = {
    module.git.enable = lib.mkEnableOption "Enable Git.";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Andrey Sadkov";
      userEmail = "ad.sadkov@gmail.com";

      signing = {
        key = "088CD99523B31AAD";
        signByDefault = true;
      };

      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
      };
    };
  };
}
