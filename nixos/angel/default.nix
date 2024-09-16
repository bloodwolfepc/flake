{ config, inputs, pkgs, lib, ... }: {
  imports = [       
    inputs.hardware.nixosModules.asus-zephyrus-ga402
    ./hardware-configuration.nix
    ./monitors.nix
    ./syncthing.nix
    ../modules/users/bloodwolfe
    ../modules/preset/main.nix
    ../modules/hardware/behringer-404-hd
    ../modules/hardware/gpu-passthrough.nix
    ../modules/hardware/rog-zypherus-g14.nix
  ];
  networking.hostName = "angel";
}
