{
  lib,
  config,
  ...
}:

let
  cfg = config.module.sound;
in
{
  options = {
    module.sound.enable = lib.mkEnableOption "Enable sound.";
  };

  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
  };
}
