{ pkgs, ... }:
{
  packages = with pkgs; [
    
    xf86_input_wacom

    wl-clipboard

    playerctl

	  xdg-desktop-portal
	  xdg-desktop-portal-wlr
	  xdg-desktop-portal-gtk
	  xdg-desktop-portal-hyprland
  ];
}
