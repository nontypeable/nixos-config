{
  module = {
    boot.enable = true;
    nix.enable = true;
    users.enable = true;
    timezone.enable = true;
    virtualization.enable = true;
    bluetooth.enable = true;
    zram.enable = true;

    packages = {
      systemPackages.enable = true;
      gnupg.enable = true;
      plasma.enable = true;
      steam.enable = true;
      zsh.enable = true;
    };
  };
}
