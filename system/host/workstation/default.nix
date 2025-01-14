{
  module = {
    boot.enable = true;
    nix.enable = true;
    users.enable = true;
    timezone.enable = true;

    packages = {
      systemPackages.enable = true;
    };
  };
}
