{
  imports = [
    ../require
    ../stylix
    ../virtualization/libvirt.nix
    #../virtualization/docker.nix
    ../virtualization/podman.nix
    ../networking/printing.nix
    ../networking/wireguard.nix
    ../extra-modules/ephemeral-btrfs.nix
    #../server/nixarr.nix
    
    ../server/waterdreamer
    ../server/waterdreamer-blog
    ../server/nginx-proxy
    ../server/calibre
  ];
}
