{ 
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/.local/share/PrismLauncher/instances" = {
      path = "/sync/home/bloodwolfe/.local/share/PrismLauncher/instances";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
    "/sync/home/bloodwolfe/.local/share/packwiz" = {
      path = "/sync/home/bloodwolfe/.local/share/packwiz";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
    "/sync/home/bloodwolfe/.config/ferium" = {
      path = "/sync/home/bloodwolfe/.config/ferium";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
  };
}
