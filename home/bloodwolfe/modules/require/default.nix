{ config, lib, pkgs, outputs, ... }:
{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./fonts.nix
    ./neovim.nix
    ./zoxide.nix
    ./git.nix

  ] ++ (builtins.attrValues outputs.customHomeManagerModules);

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  nix = { 
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };




  home = {
    username = lib.mkDefault "bloodwolfe";
    stateVersion = lib.mkDefault "23.05";
    homeDirectory = "/home/bloodwolfe";

    sessionVariables = {
      FLAKE = "$HOME/flake";
    };

    packages = with pkgs; [

	    #thefuck
      ripgrep
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
  };
}

        
        


        
