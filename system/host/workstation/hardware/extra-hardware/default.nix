{ pkgs, ... }:

{
  hardware = {
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;

    firmware = with pkgs; [ linux-firmware ];
  };
}