#TODO bookmark managerment: flocus, nextcloudbookmarks, linkding
{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "firefox";
    persistDirs = [
      ".mozilla"
      ".cache/mozilla"
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.firefox.enable = true;
    xdg.mimeApps.defaultApplications = {
      "text/html" = ["firefox.desktop"];
      "text/xml" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
    };
  };
in {
  inherit (attrs) options config;
}



 
