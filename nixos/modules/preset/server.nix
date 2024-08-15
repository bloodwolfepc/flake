{
  imports = [
    ../require
    ../stylix
    ../virtualization/libvirt.nix
    ../virtualization/docker.nix
    ../networking/printing.nix
    ../networking/wireguard.nix
    ../extra-modules/ephemeral-btrfs.nix
    #../server/nixarr.nix
  ];
}
