{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with pkgs; [
    linuxKernel.packages.linux_zen.v4l2loopback 
  ];
  boot.kernelModules = [ 
    "v4l2loopback" 
  ];
}
