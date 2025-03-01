{
  systemd.services.disable-gpp0 = {
    description = "Disable GPP0 to fix suspend issue";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = ''/bin/sh -c "grep -q 'GPP0.*enabled' /proc/acpi/wakeup && echo GPP0 > /proc/acpi/wakeup || true"'';
    };
  };
}
