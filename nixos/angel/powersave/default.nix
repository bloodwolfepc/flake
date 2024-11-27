{ lib, ... }: {
  imports = [
    ./powersave.nix
  ];
  options = {
    hardware.asus-zypherus-ga402.powersave = {
      enable = lib.mkEnableOption "Configure QEMU for vfio Passthough, create VM launch options.";
    };
  };
}
