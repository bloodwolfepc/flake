{ config, pkgs, lib, user, ... }:

{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "23.11"; 
  home.packages = with pkgs; [
	#thefuck
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
	lolcat
	swaynotificationcenter
	xdg-desktop-portal
	xdg-desktop-portal-wlr
	xdg-desktop-portal-gtk
	xdg-desktop-portal-hyprland
	polkit-kde-agent
	grimblast
	gromit-mpx
	xfce.thunar
	krita
	gimp
	firefox
	discord
	spotify 
	spotify-player
	playerctl
	sptlrx

	swww

	gamemode
	#wine-wow-wayland #i might need staging idk
	gamescope
	steam-tui
	steamPackages.steamcmd
	steam-run

	ruby
  lua
  ctags

	wl-clipboard
  gay
  xf86_input_wacom

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
	extraLuaConfig = lib.fileContents ./scripts/nvim/init.lua;
	#extraConfig = ''
    #set number relativenumber
#	'';
};

imports = [
	./modules/zsh.nix
	./modules/waybar.nix
	./modules/rofi.nix
	./modules/home-hyprland.nix
  ./modules/tmux.nix
];

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


