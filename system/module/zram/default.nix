{
  lib,
  config,
  ...
}:

let
  cfg = config.module.zram;
in
{
  options = {
    module.zram.enable = lib.mkEnableOption "Enable zram.";
  };

  config = lib.mkIf cfg.enable {
    zramSwap = {
      enable = true;
      priority = 100;
      algorithm = "zstd";
      memoryPercent = 25;
    };
  };
}
