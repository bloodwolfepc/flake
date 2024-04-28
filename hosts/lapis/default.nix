{ inputs, ... }: {
  imports =
    [  
	    inputs.hardware.nixosModules.common-cpu-intel
	    inputs.hardware.nixosModules.common-gpu-amd
      ./hardware-configuration.nix

      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/nvme0n1"; })
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/require


      ../modules/option/gui/gaming/steam.nix
      ../modules/option/gui/gaming/jovian-software.nix

      ../modules/option/gui/desktop-environment/hyprland.nix
      ../modules/option/gui/desktop-environment/xdg-portal.nix

      ../modules/option/virtualization/libvirt.nix
      ../modules/option/virtualization/docker.nix
      ../modules/option/virtualization/waydroid.nix

      ../modules/option/security/yubikey.nix
      ../modules/option/spec/printing.nix
      ../modules/option/audio/focusrite-low-latency-audio.nix

      ../modules/users/bloodwolfe
    ];
  networking.hostName = "lapis";
}
