{ pkgs, ... }:
{
  home.packages = with pkgs; [
    
    xf86_input_wacom

    wl-clipboard
    cliphist

    playerctl

	  xdg-desktop-portal
	  xdg-desktop-portal-wlr
	  xdg-desktop-portal-gtk
	  xdg-desktop-portal-hyprland
  ];
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };
}
