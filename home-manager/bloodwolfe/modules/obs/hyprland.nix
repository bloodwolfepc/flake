{ lib, pkgs, config, ... }: let
  name = "obs";
  program = "${pkgs.obs-studio}/bin/obs";
  bind = "o";
in {
  wayland.windowManager.hyprland = {
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