{
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/.config/GIMP" = {
      path = "/sync/home/bloodwolfe/.config/GIMP";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    
    "/sync/home/bloodwolfe/.local/share/krita" = {
      path = "/sync/home/bloodwolfe/.local/share/krita";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    "/sync/home/bloodwolfe/.config/DIR-kritarc" = {
      path = "/sync/home/bloodwolfe/.config/DIR-kritarc";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    "/sync/home/bloodwolfe/.config/DIR-kritadisplay" = {
      path = "/sync/home/bloodwolfe/.config/DIR-kritadisplayrc";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
  };
}
