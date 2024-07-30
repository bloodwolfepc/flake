#TODO the location of this is pretty bad I should move it
{ config, pkgs, lib, ... }:
{
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableScDaemon = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    pinentryPackage = pkgs.pinentry-tty;
    verbose = true;
    #sshKeys = [ ];
    
  };
  programs.gpg = {
    enable = true;
    homedir = "${config.home.homeDirectory}/.gnupg";
    mutableKeys = false;
    mutableTrust = false;
    publicKeys = [ 
      {
        source = ./B74857A702B0C92B-2024-04-15.asc;
        trust = 5;
      }
    ];
    scdaemonSettings = {
        disable-ccid = true;
    };
    #package = pkgs.gnupg.override {
    #  pcsclite = pkgs.pcsclite.overrideAttrs (old: {
    #    postPatch = old.postPatch + (lib.optionalString (!(lib.strings.hasInfix ''--replace-fail "libpcsclite_real.so.1"'' old.postPatch)) ''
    #      substituteInPlace src/libredirect.c src/spy/libpcscspy.c \
    #      --replace-fail "libpcsclite_real.so.1" "$lib/lib/libpcsclite_real.so.1"
    #    '');
    #  });
    #};
  };
}
