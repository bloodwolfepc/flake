{ lib, ... }: {
  imports = [
    ./gpu-detatched.nix
    ./vfio-passthrough.nix
  ];
  options = {
    hardware.amdgpu.gpu-detatched = {
      enable = lib.mkEnableOption "Detatch gpu on boot.";
    };
    programs.qemu.vfio-passthough = {
      enable = lib.mkEnableOption "Configure QEMU for vfio Passthough, create VM launch options.";
    };
  };
}
    

