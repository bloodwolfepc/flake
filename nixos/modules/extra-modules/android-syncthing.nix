#if this is imported android files will be synced in /sync
{
  services.syncthing.settings.folders = {
    "pictures" = {
      path = "/sync/home/bloodwolfe/android/pictures";
      devices = [ "navi" "lapis" "angel" "android" ];
      ignorePerms = true;
    };
    "camera" = {
      path = "/sync/home/bloodwolfe/android/camera";
      devices = [ "navi" "lapis" "angel" "android" ];
      ignorePerms = true;
    };
    "recordings" = {
      path = "/sync/home/bloodwolfe/android/recordings";
      devices = [ "navi" "lapis" "angel" "android" ];
      ignorePerms = true;
    };
    "rpgmaker" = {
      path = "/sync/home/bloodwolfe/android/rpgmaker";
      devices = [ "navi" "lapis" "angel" "android" ];
      ignorePerms = true;
    };
  };
}
