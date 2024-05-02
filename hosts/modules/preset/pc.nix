{
  imports = [

    ../option/boot/systemdboot.nix
    ../option/kernal/zen.nix

    ../option/networking/ssh.nix
    ../option/networking/printing.nix
    ../option/networking/wireguard.nix
    ../option/networking/networkmanager.nix
    ../option/networking/bluetooth.nix

    ../option/gui/gaming/steam.nix
    ../option/gui/desktop-environment/hyprland.nix
    ../option/gui/desktop-environment/xdg-portal.nix

    ../option/virtualization/docker.nix
    ../option/virtualization/waydroid.nix
    ../option/virtualization/libvirt.nix

    ../option/security/yubikey.nix

    ../option/systemd/systemd.nix

    ../option/audio/pipewire.nix

  ];
}
