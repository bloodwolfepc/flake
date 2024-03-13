{ config, pkgs, lib, user, ... }:

{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "23.11"; 
  home.packages = with pkgs; [
	thefuck
	git
	#gh
	pkgs.gitAndTools.gh
	git
	sops
	gnupg
 	hello
	neofetch
	tree
	zsh
	lf
	ranger
	swaynotificationcenter
	xdg-desktop-portal
	xdg-desktop-portal-wlr
	xdg-desktop-portal-gtk
	xdg-desktop-portal-hyprland
	polkit-kde-agent
	ksnip
	wofi
	alacritty
	xfce.thunar
	krita


	#gamemode
	#wine-wow-wayland #i might need staging idk
	#gamescope
	#steam-tui


];
	#home.packages = [ pkgs.gitAndTools.gh ];
	programs.gh.enable = true;
	programs.git.enable = true;


  home.file = {
    
  };

    home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
	
programs.neovim = {
	enable = true;
	extraLuaConfig = lib.fileContents ./nvim-init.lua;
    #set number relativenumber
  #;
};

imports = [
	./zsh.nix
	#./steam.nix

];

programs.waybar = {
	enable = true;
};
}
