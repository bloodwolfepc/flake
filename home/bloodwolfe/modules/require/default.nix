{ lib, pkgs, outputs, ... }:
{
  imports = [
    ./cli/cli-ui/zsh.nix
    ./cli/cli-ui/tmux.nix
    ./cli/editors/lf.nix
    ./cli/editors/neovim.nix
    ./cli/resource-monitoring/btop.nix
    ./cli/resource-monitoring/htop.nix
    ./util/git.nix
    ./util/ssh.nix
    ./util/zoxide.nix
    ./util/ripgrep.nix
    ./util/thefuck.nix
    ./util/hyfetch.nix
    ./util/miscellaneous-utils.nix
    ./impermanence.nix

    ./security/gpg.nix
    ./security/bitwarden.nix
    ./security/sops.nix

  ] ++ (builtins.attrValues outputs.customHomeManagerModules);

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };
  
	home.persistence."/persist/home/bloodwolfe" = {
    directores = [ 
      ".cache/nix-index"
    ];
  };
  
  services.nix-serv = {
    enable = true;
    secretkeyFile = "";
    nginx = {
      enable = true;
    };
  };
  
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

    sessionVariables = {
      FLAKE = "$HOME/projects/flake";
    };
    packages = with pkgs; [
      home-manager
    ];

  };
} 
