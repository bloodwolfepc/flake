{ 
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/games" = {
      path = "/sync/home/bloodwolfe/games";
      devices = [ "navi" "lapis" "angel" "android" ];
      ignorePerms = true;
    };  
    "/sync/home/bloodwolfe/.config/retroarch/saves" = {
      path = "/sync/home/bloodwolfe/.conifg/retroarch/saves";
      devices = [ "navi" "lapis" "angel" "android" ];
      ignorePerms = true;
    };
    "/sync/home/bloodwolfe/.config/retroarch/states" = {
      path = "/sync/home/bloodwolfe/.conifg/retroarch/states";
      devices = [ "navi" "lapis" "angel" "android" ];
      ignorePerms = true;
    };
    "/sync/home/bloodwolfe/.config/retroarch/system" = {
      path = "/sync/home/bloodwolfe/.conifg/retroarch/system";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
    "/sync/home/bloodwolfe/.config/retroarch/config" = {
      path = "/sync/home/bloodwolfe/.conifg/retroarch/config";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
  };
}
