{ pkgs, lib, ... }: {
  imports = [
    ./hyprland.nix
    ./hyprland-init.nix
    ./swaync.nix
    ./rofi.nix
    ./waybar.nix
    ./alacritty.nix
  ];
  home.packages = [
    pkgs.wayvnc
    pkgs.swww
    pkgs.grimblast
    
    (pkgs.writeShellScriptBin "pc" ''
      ${pkgs.hyprland}/bin/Hyprland
    '')
  ];
}
