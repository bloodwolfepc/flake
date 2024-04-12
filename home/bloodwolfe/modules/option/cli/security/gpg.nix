{ config, pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableScDaemon = true;
    enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-tty;
    verbose = true;
    sshKeys = [ ];
  };
  programs.gpg = {
    enable = true;
    homedir = "${config.home.homeDirectory}/.gnupg";
    #mutableKeys = false;
    #mutableTrust = false;
    publicKeys = [ 
      {
        source = ./469F9D3A5AD73958-2024-04-12.asc;
        trust = 5;
      }
    ];
    scdaemonSettings = {
        disable-ccid = true;
    };
  };
  home.packages = with pkgs; [
    yubikey-manager
  ];
}
