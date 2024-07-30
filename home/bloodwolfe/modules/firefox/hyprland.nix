{ lib, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    #TODO possibly replace alacritty integration with the drop down terminal thing
    extraconfig = lib.mkBefore ''
      submap = EXEC_WS
        bindi = , j, workspace, name:termfox
        bindi = , j, exec ${pkgs.firefox}/bin/firefox
        bindi = , j, exec ${pkgs.alacritty}/bin/alacritty --command tmux
      submap = escape
      submap = EXEC
        bindi = , j, exec, ${pkgs.firefox}/bin/firefox
      submap = escape
      submap = WS
        bindi = , j, workspace, name:termfox
      submap = escape
    '';
  };
}
