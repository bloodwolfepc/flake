{ 
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/notebook" = {
      path = "/sync/home/bloodwolfe/notebook";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
    "/sync/home/bloodwolfe/library" = {
      path = "/sync/home/bloodwolfe/library";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    }; 
    "/sync/home/bloodwolfe/snippets" = {
      path = "/sync/home/bloodwolfe/snippets";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    }; 
  };
}
