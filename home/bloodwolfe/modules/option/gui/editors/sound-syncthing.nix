{
  services.syncthing.settings.folders = {
    "/data/sound/ardour" = {
      path = "/data/home/bloodwolfe/ardour";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    "/data/sound/vital" = {
      path = "/data/home/bloodwolfe/vital";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    "/data/sound/sfz" = {
      path = "/data/home/bloodwolfe/sfz";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    "/data/sound/carla" = {
      path = "/data/home/bloodwolfe/carla";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    "/data/sound/orca" = {
      path = "/data/home/bloodwolfe/orca";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    
    #dotfiles
    "/data/home/bloodwolfe/.config/ardour8" = {
      path = "/data/home/bloodwolfe/.config/ardour8";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    "/data/home/bloodwolfe/.local/share/vital" = {
      path = "/data/home/bloodwolfe/.local/share/vital";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
  };
}
