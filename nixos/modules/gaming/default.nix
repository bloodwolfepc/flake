{ pkgs, ... }: {
  imports = [
    ./steam.nix
    ./gamemode.nix
    ./gamescope.nix
  ];
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau-va-gl
    ];
  }; 
}
