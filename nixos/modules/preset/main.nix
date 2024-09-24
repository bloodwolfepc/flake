{
  imports = [
    ../require
    ../pc
    ../gaming
    ../stylix
    ../boot/systemdboot
    ../kernel/zen.nix
    ../audio/low-latency-audio
    ../virtualization/libvirt.nix
    ../virtualization/podman.nix
    ../virtualization/waydroid.nix
    ../networking/printing.nix
    ../networking/bluetooth.nix
    ../networking/wireguard.nix
    ../networking/networkmanager.nix
    ../extra-modules/ephemeral-btrfs.nix
    ../extra-modules/display-calibration.nix
    ../extra-modules/kde-connect.nix
    ../extra-modules/wine.nix
    ../extra-modules/flatpak.nix
  ];
}
  
