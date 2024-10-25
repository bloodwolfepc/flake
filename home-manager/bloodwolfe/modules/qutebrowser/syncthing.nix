{ 
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/.local/share/qutebrowser" = {
      path = "/sync/home/bloodwolfe/.local/share/qutebrowser";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
    "/sync/home/bloodwolfe/.config/qutebrowser/bookmarks" = {
      path = "/sync/home/bloodwolfe/.config/qutebrowser/bookmarks";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
    "/sync/home/bloodwolfe/.config/qutebrowser/greasemonkey" = {
      path = "/sync/home/bloodwolfe/.config/qutebrowser/greasemonkey";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
  };
}
