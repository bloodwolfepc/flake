{ 
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/rpgmaker" = {
      path = "/sync/home/bloodwolfe/rpgmaker";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    "/sync/home/bloodwolfe/.config/retroarch" = {
      path = "/sync/home/bloodwolfe/.conifg/retroarch";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
    "/sync/home/bloodwolfe/.local/share/PrismLauncher/instances" = {
      path = "/sync/home/bloodwolfe/.local/share/PrismLauncher/instances";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = false;
    };
  };
}
