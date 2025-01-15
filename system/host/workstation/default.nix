{
  module = {
    boot.enable = true;
    nix.enable = true;
    users.enable = true;
    timezone.enable = true;
    virtualization.enable = true;

    packages = {
      systemPackages.enable = true;
      gnupg.enable = true;
      plasma.enable = true;
    };
  };
}
