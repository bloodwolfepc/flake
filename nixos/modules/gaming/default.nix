{ pkgs, ... }: {
  imports = [
    ./steam.nix
    ./gamemode.nix
    ./gamescope.nix
  ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau-va-gl
    ];
  }; 
}
