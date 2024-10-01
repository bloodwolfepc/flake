{ 
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/.config/task" = {
      path = "/sync/home/bloodwolfe/.config/task";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
  };
}
