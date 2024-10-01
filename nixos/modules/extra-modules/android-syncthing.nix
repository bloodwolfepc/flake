#if this is imported android files will be synced in /sync
{
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/android/DCIM" = {
      path = "/sync/home/bloodwolfe/android/DCIM";
      devices = [ "navi" "lapis" "angel" "android" ];
      ignorePerms = true;
    };
    #"android:/games" = {
    #  path = "/sync/home/bloodwolfe/games";
    #  devices = [ "navi" "lapis" "angel" "android" ];
    #  ignorePerms = true;
    #};
    #"android:/RetroArch/saves" = {
    #  path = "/sync/home/bloodwolfe/RetroArch/saves";
    #  devices = [ "navi" "lapis" "angel" "android" ];
    #  ignorePerms = true;
    #};
    #"android:/RetroArch/states" = {
    #  path = "/sync/home/bloodwolfe/RetroArch/states";
    #  devices = [ "navi" "lapis" "angel" "android" ];
    #  ignorePerms = true;
    #};
    #"android:/RetroArch/screenshots" = {
    #  path = "/sync/home/bloodwolfe/RetroAarch/screenshots";
    #  devices = [ "navi" "lapis" "angel" "android" ];
    #  ignorePerms = true;
    #};
  };
}
