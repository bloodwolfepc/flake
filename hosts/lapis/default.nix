{ inputs, ... }: {
  imports =
    [  
	    inputs.hardware.nixosModules.common-cpu-intel
	    inputs.hardware.nixosModules.common-gpu-amd
      ./hardware-configuration.nix
      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/nvme0n1"; })
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/option/spec/openrgb.nix
      ../modules/option/audio/focusrite-low-latency-audio.nix
      ../modules/require

      ../modules/preset/full-system.nix

      ../modules/users/bloodwolfe

    ];
  networking.hostName = "lapis";
}
