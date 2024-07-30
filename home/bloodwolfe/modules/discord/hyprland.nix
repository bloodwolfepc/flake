{ lib, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    extraconfig = lib.mkBefore ''
      submap = EXEC_WS
        bindi = , d, workspace, name:discord
        bindi = , d, exec ${pkgs.vesktop}/bin/vesktop
      submap = escape
      submap = EXEC
        bindi = , d, exec, ${pkgs.vesktop}/bin/vesktop
      submap = escape
      submap = WS
        bindi = , d, workspace, name:vesktop
      submap = escape
    '';
  };
}
