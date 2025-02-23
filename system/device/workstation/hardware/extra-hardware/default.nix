{ pkgs, ... }:

{
  hardware = {
    enableAllFirmware = true;
    cpu.amd = {
      updateMicrocode = true;
      sev.enable = true;
    };
    enableRedistributableFirmware = true;
  };
}
