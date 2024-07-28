{
  services.syncthing.settings.folders = {
    "/data/sound/ardour" = {
      path = "/data/sound/ardour";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/vital" = {
      path = "/data/sound/vital";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/sfz" = {
      path = "/data/sound/sfz";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/carla" = {
      path = "/data/sound/carla";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/orca" = {
      path = "/data/sound/orca";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    
    #dotfiles
    "/data/home/bloodwolfe/.config/ardour8" = {
      path = "/data/home/bloodwolfe/.config/ardour8";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/home/bloodwolfe/.local/share/vital" = {
      path = "/data/home/bloodwolfe/.local/share/vital";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
  };
}
