{ lib, config, pkgs, ... }: let 
  #TODO extra sync and backup dirs
  #~/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common
  #webfishing, fear and hunger

  attrs = lib.custom.mkHomeApplication {
    name = "steam";
    key = "s";
    command = "${pkgs.wezterm}/bin/wezterm";
    persistDirs = [
      ".local/share/Steam"
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = let
    adhere-workspace = "g";
  in {
    wayland.windowManager.hyprland = {
      settings.windowrulev2 = [
        "float, class:^([Ss]team)$, title:^((?![Ss]team).*)$"
        "tile, class:^([Ss]team)$, title:^([Ss]team)$"
        "workspace name:${adhere-workspace} silent, class:^([Ss]team)$, title:^([Ss]team)$"
        "workspace name:${adhere-workspace} silent, class:^([Ss]special [Oo]ffers)$, title:^([Ss]special [Oo]ffers)$"
        "workspace name:${adhere-workspace} silent, class:^([Ss]ign [Ii]n [Tt]o [Ss]team)$, title:^([Ss]ign [Ii]n [Tt]o [Ss]team)$"
      ];
    };
  };
in {
  inherit (attrs) options config;
}
