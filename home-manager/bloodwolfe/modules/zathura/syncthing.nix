{ 
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/.local/share/zathura" = {
      path = "/sync/home/.local/share/zathura";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
  };
}

