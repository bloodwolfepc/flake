{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    extraConfig = ''
      submap = EXEC
        bindi = , d, workspace, name:ardour
        bindi = , d, exec, ${pkgs.ardour}/bin/ardour8
      submap = escape
      submap = GLOBAL
        bindi = , d, workspace, name:ardour
      submap = escape
      '';
    settings.windowrulev2 = [ 
      #fixes a bug for dragging objects in mixers for ardour
      "noinitialfocus, xwayland:1"
    ];
  };
}
