{
  services.syncthing.settings.folders = {
    "/data/sound/ardour" = {
      path = "/data/home/bloodwolfe/data/ardour";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/vital" = {
      path = "/data/home/bloodwolfe/data/vital";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/sfz" = {
      path = "/data/home/bloodwolfe/data/sfz";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/carla" = {
      path = "/data/home/bloodwolfe/data/carla";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/orca" = {
      path = "/data/home/bloodwolfe/data/orca";
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
