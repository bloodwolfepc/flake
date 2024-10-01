#TODO certain systems should have the option to use sync or local
{ lib, pkgs, outputs, config, ... }:
{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./lf.nix
    ./neovim.nix
    ./btop.nix
    ./htop.nix
    ./git.nix
    ./ssh.nix
    ./zoxide.nix
    ./ripgrep.nix
    ./thefuck.nix
    ./hyfetch.nix
    ./impermanence.nix
    ./sgpt.nix
    ./gpg
    ./bitwarden.nix
    ./sops.nix

  ] ++ (builtins.attrValues outputs.customHomeManagerModules);
    

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };
  
	home.persistence."/persist/home/bloodwolfe" = {
    directories = [ 
      ".cache/nix-index" #put in a devtools section
      ".local/share/flatpak" #TODO give me a home
      "appimages"
    ];
  };
  
  #services.nix-serv = {
  #  enable = true;
  #  secretkeyFile = "";
  #  nginx = {
  #    enable = true;
  #  };
  #};
  
  programs.home-manager.enable = true;
  #systemd.user.startServices = "sd-switch";

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
    stateVersion = lib.mkDefault "23.11";
    homeDirectory = "/home/bloodwolfe";
    #programs.fd.enable = true;
    #programs.feh.enable = true;

    sessionVariables = {
      FLAKE = "$HOME/projects/flake";
    };

    packages = with pkgs; [
      #home-manager
      tree
      ctags
      fzf
      sops
      tldr
      lolcat
      gay
      neofetch
      jq
      fd
      nix-visualize
      nix-tree
      wget
      unzip
      taskwarrior-tui
    ];
  };
} 
