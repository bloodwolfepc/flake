{ lib, pkgs, config, ... }: let
  name = "ardour";
  program = "${pkgs.ardour}/bin/ardour8";
  bind = "u";
in {
  wayland.windowManager.hyprland = {
    settings.windowrulev2 = [
      #fix draggables in ardour
      "noinitialfocus , xwayland:1"
    ];
    extraConfig = lib.mkBefore ''
	    submap = EXEC
        bindi = , ${bind}, submap ,EXEC_${name}
	    submap = escape
      submap = EXEC_${name}
	      bindi = , ${config.kb_RIGHT}, layoutmsg, preselect r
	      bindi = , ${config.kb_DOWN}, layoutmsg, preselect d
	      bindi = , ${config.kb_UP}, layoutmsg, preselect u
	      bindi = , ${config.kb_LEFT}, layoutmsg, preselect l
	      bindi = , ${config.kb_RIGHT}, exec, ${program}
	      bindi = , ${config.kb_DOWN}, exec, ${program}
	      bindi = , ${config.kb_UP}, exec, ${program}
	      bindi = , ${config.kb_LEFT}, exec, ${program}
        bindi = , ${config.kb_INS}, submap, INS
        bindi = , ${config.kb_NML}, submap, NML
        source = $pass-oneshots
      submap = escape
      submap = EXEC_WS
        bindi = , ${bind}, workspace, name:${name}
        bindi = , ${bind}, exec, ${program}
      submap = escape
      submap = WS
        bindi = , ${bind}, workspace, name:${name}
      submap = escape
    '';
  };
}
