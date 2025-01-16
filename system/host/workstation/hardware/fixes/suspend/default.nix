{
  systemd.services.disable-gpp0 = {
    description = "Disable GPP0 to fix suspend issue";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "/bin/sh -c 'echo GPP0 > /proc/acpi/wakeup'";
    };
  };
}
