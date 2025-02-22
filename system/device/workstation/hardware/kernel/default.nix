{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages;
    kernelModules = [
      "kvm-amd"
      "amdgpu"
    ];

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];

      kernelModules = [
        "amdgpu"
      ];
    };
  };
}
