{ config, pkgs, lib, user, ... }:

{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "23.11"; 
  home.packages = with pkgs; [
	thefuck
	git
	gh
	pkgs.gitAndTools.gh
	sops
	gnupg
 	hello
	neofetch
	tree
	zsh
	lf
	ranger
	btop
	htop
	zoxide
	swaynotificationcenter
	xdg-desktop-portal
	xdg-desktop-portal-wlr
	xdg-desktop-portal-gtk
	xdg-desktop-portal-hyprland
	polkit-kde-agent
	ksnip
	xfce.thunar
	krita
	gimp
	firefox
	discord
	spotify 


	#fonts
	unscii
	scientifica

	swww



	gamemode
	#wine-wow-wayland #i might need staging idk
	gamescope
	steam-tui
	steamPackages.steamcmd
	steam-run

	#pl
	ruby


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
	./waybar.nix
	./rofi.nix
	#./steam.nix

];

wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = ''
  source=./hypr/monitor.conf
  source=./hypr/variables.conf
  source=./hypr/definitions.conf
  source=./hypr/environment.conf
  source=./hypr/keybinds.conf
  source=./hypr/modes.conf
  source=./hypr/rules.conf
  '';
  };

programs.alacritty = {
	enable = true;
	settings = {
		font = {
			normal.family = "unscii";
			normal.style = "16-full";
			};
		window = {
			opacity = 0.0;
			blur = false;
		};
	};
	
};

}


