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

  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
  ];

  #android
  programs.adb.enable = true;
  environment.systemPackages = [ 
    pkgs.universal-android-debloater 
  ];
  users.users.bloodwolfe.extraGroups = ["adbusers"];
  services.nginx = {
    enable = true; 
        virtualHosts.localhost = {
          locations."/" = {
            return = "200 '<html><body>It works</body></html>'";
            extraConfig = ''
              default_type text/html;
            '';
          };
        };
      };
}
