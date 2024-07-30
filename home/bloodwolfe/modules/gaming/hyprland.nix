{ lib, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    extraconfig = lib.mkBefore ''
      submap = EXEC_WS
        bindi = , g, workspace, name:steam
        bindi = , g, exec ${pkgs.steam}/bin/steam
      submap = escape
      submap = EXEC
        bindi = , g, exec, ${pkgs.steam}/bin/steam
      submap = escape
      submap = WS
        bindi = , g, workspace, name:steam
      submap = escape
    '';
    #make rule that foces steam on ws name:steam
  };
}
