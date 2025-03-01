{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages;
    kernelModules = [
      "kvm-amd"
      "amdgpu"
    ];

    kernelParams = [
      "resume=/dev/disk/by-partlabel/swap"
      "resume_offset=0"
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
