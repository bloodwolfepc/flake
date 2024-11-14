{ config, ... }: {
  services.syncthing.settings.folders = {
    "/sync/home/bloodwolfe/.config/libreoffice" = {
      path = "/sync/home/bloodwolfe/.config/libreoffice";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
  };
}
