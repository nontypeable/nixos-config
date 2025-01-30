<div align="center"><img src="assets/readme/logos/nixos-logo.svg" width="300px"></div>

<h1 align="center">nontypeable's NixOS Flake</h1>

<div align="center">

![license](assets/readme/badges/license.svg)

</div>

## Features

- ❄️ Flakes - for portability between devices.
- 🏡 Home Manager - for configuring all software for the user.
- 💽 Disko - for declarative disk partitioning.

## File structure

- [❄️ flake.nix](flake.nix) - Configuration entry point.
- [🏠 home](home/default.nix) - Home Manager root config.
  - [🧩 modules](home/modules/) - Shared user modules.
  - [👤 users](home/users/) - Per-user configurations.
    - [👨💻 andrey](home/users/andrey/) - Primary user setup.
      - [📦 packages](home/users/andrey/modules/packages/) - User-specific apps.
- [🖥️ system](system/default.nix) - System configuration core.
  - [🏗️ host](system/host/) - Machine profiles.
    - [💻 workstation](system/host/workstation/) - Main machine setup.
      - [⚙️ hardware](system/host/workstation/hardware/) - Device-specific tuning.
  - [🧩 nixos](system/nixos/modules/) - Shared system modules.
- [📚 lib](lib/default.nix) - Shared utility functions.
- [🎨 treefmt](treefmt/default.nix) - Flake formatting config.

## Hosts description

| Hostname           | Board             | CPU           | RAM  | GPU                                      | OS    |
| ------------------ | ----------------- | ------------- | ---- | ---------------------------------------- | ----- |
| <b>workstation</b> | Aorus B550 Pro v2 | Ryzen 5 5600x | 32GB | Gigabyte AMD Radeon RX 6800 XT Gaming OC | NixOS |
