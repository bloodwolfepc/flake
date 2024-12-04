{
  mkSyncthingAttrs = lib: dirs: lib.genAttrs dirs (dir: { dir = {
    path = dir;
    devices = [ "navi" "lapis" "angel" ];
    ignorePerms = true;
  };});

  mkSyncthingAttrs' = lib: dirs: devices: lib.genAttrs dirs devices (dir: {
    path = "${dir}";
    inherit devices;
    ignorePerms = true;
  }); 
}
