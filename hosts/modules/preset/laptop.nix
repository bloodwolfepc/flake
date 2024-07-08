{
  imports = [
    ../option/boot/systemdboot.nix
    ../option/kernal/zen.nix
    ../option/systemd/systemd.nix

    ../option/security/yubikey.nix
    ../option/audio/pipewire.nix

    ./collection/gaming-complete.nix
    ./collection/hyprland-complete.nix
    ./collection/networking-complete.nix
    ./collection/virtualization-complete.nix
    
  ];
  boot.loader.efi.canTouchEfiVariables = true;
}
