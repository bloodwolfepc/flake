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
  services.resolved.enable = true;

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
  ];

  #android
  programs.adb.enable = true;
  environment.systemPackages = [ 
    pkgs.universal-android-debloater 
  ];
  users.users.bloodwolfe.extraGroups = ["adbusers"];      
  #environment.sessionVariables = {
  #  GTK_IM_MODULE = "fcitx";
  #  QT_IM_MODULE = "fcitx";
  #  XMODIFIES = "@im=fcitx";
  #};
}
