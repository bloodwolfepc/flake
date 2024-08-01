#TODO clipboard history management, screenshots
# bind that:
#moves firefox to a position of the aftive workspace and another to return it
{ pkgs, lib, config, ... }: {
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      exec-once = [
        "hyprctl dispatch workspace name:main"
        "hyprctl dispatch submap INS"
        "${pkgs.alacritty}/bin/alacritty --command tmux"
        "${pkgs.swww}/bin/swww daemon"
        "${pkgs.swww}/bin/swww img = ${config.wallpaper}"
        "swaync --inhibitor-add Alacritty" #block spotify_player
        "wl-paste -t text -w xclip -selection clipboard" #patch for wine
      ];
      env = [
	      "XCURSOR_SIZE,24"
	      "QT_QPA_PLATFORMTHEME,qt6ct"
	      "QT_QPA_PLATFORM=wayland;xcb"
	      "GDK_BACKEND=wayland,x11"
	      "SDL_VIDEODRIVER=wayland"
	      "CLUTTER_BACKEND=wayland"
	      "XDG_CURRENT_DESKTOP=sway"
	      "XDG_DESSION_TYPE=wayland"
	      "XDG_SESSION_DESKTOP=Hyprland"
	      "WLR_DRM_NO_ATOMIC,1"
	      "WLR_DRM_NO_ATOMIC,1"
        "MOZ_ENABLE_WAYLAND=1"
      ];
      general = {
        allow_tearing = true;
        #border_size = "0";
        #gaps_in = "0";
        #gaps_out = "0";
      };
	    dwindle = {
	      pseudotile = true;
	      preserve_split = true;
	      permanent_direction_override = true;
	    };
      decoration = {
        blur.enabled = false;
        drop_shadow = false;
      };
      animations.enabled = false;
	    input = {
	      kb_layout = "us";
	      follow_mouse = "1";
	      sensitivity = "0";
	      accel_profile = "flat";
        #cursor = {
        #  inactive_timeout = 0.5;
        #  hide_on_key_press = true;
        #  hide_on_touch = true;
        #};
	    };
      monitor = map
        (m:
          let 
            resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
            position = "${toString m.x}x${toString m.y}";
          in
          "${m.name},${if m.enabled then "${resolution},${position},1" else "disable"}"
        )
        (config.monitors);
    };
    extraConfig = lib.mkBefore ''
      submap = INS
        bind = , ${config.kb_NML}, submap, NML
      submap = escape
      submap = NML
	      bindi = ,${config.kb_INS}, submap, INS
	      bindi = ,${config.kb_EXEC}, submap, EXEC
	      bindi = ,${config.kb_WS}, submap, WS
	      bindi = ,${config.kb_EXEC_WS}, submap, EXEC_WS
	      bindi = ,${config.kb_TERM}, submap, TERM
	      bindi = ,${config.kb_MIGRATE}, submap, MIGRATE
	      bindi = ,${config.kb_POSITION}, submap, POSITION
	      bindi = ,${config.kb_RESIZE}, submap, RESIZE
	      bindi = ,${config.kb_REC}, submap, REC
	      bindi = ,${config.kb_MONITOR}, submap, MONITOR
        
	      bindm = , mouse:272, movewindow
	      bindm = , mouse:273, resizewindow
	      bindi = , ${config.kb_RIGHT}, movefocus, r
	      bindi = , ${config.kb_DOWN}, movefocus, d
	      bindi = , ${config.kb_UP}, movefocus, u
	      bindi = , ${config.kb_LEFT}, movefocus, l
	      bindi = , SPACE, togglefloating
	      bindi = , v, fullscreen
	      bindi = , x, killactive
      submap = escape
      submap = POSITION
	      bindi = , ${config.kb_RIGHT}, movewindow, r
	      bindi = , ${config.kb_DOWN}, movewindow, d
	      bindi = , ${config.kb_UP}, movewindow, u
	      bindi = , ${config.kb_LEFT}, movewindow, l
	      bindi = , SPACE, centerwindow
      submap = escape
      submap = RESIZE
	      bindm = ,mouse:272, movewindow
	      bindm = ,mouse:273, resizewindow
	      bindi = ,${config.kb_LEFT}, resizeactive, -20 0
	      bindi = ,${config.kb_DOWN}, resizeactive, 0 20
	      bindi = ,${config.kb_UP}, resizeactive, 0 -20
	      bindi = ,${config.kb_RIGHT}, resizeactive, 20 0
      submap = escape
      submap = MONITOR
        bindi = ,f, focusmonitor, DP-3
        bindi = ,d, focusmonitor, eDP-2
      submap = escape
    '';      
  };
}
