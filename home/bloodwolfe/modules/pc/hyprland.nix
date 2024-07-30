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
        border_size = "0";
        gaps_in = "0";
        gaps_out = "0";
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
    };
    extraconfig = lib.mkBefore ''
      submap = EXEC
        bindi = , j, workspace, name:termfox
        bindi = , j, exec ${pkgs.firefox}/bin/firefox
        bindi = , j, exec ${pkgs.alacritty}/bin/alacritty --command tmux
      submap = escape
      submap = WS
        bindi = , k, workspace, name:main
        bindi = , j, workspace, name:termfox
      submap = escape
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
	      bindi = , h, movefocus, r
	      bindi = , j, movefocus, d
	      bindi = , k, movefocus, u
	      bindi = , l, movefocus, l
	      bindi = , SPACE, togglefloating
	      bindi = , v, fullscreen
	      bindi = , x, killactive
      submap = escape
      submap = POSITION
	      bindi = , h, movewindow, preselect r
	      bindi = , j, movewindow, preselect d
	      bindi = , k, movewindow, preselect u
	      bindi = , l, movewindow, preselect l
	      bindi = , SPACE, centerwindow
      submap = escape
      submap = RESIZE
	      bindm = ,mouse:272, movewindow
	      bindm = ,mouse:273, resizewindow
	      bindi = ,h, resizeactive, -20 0
	      bindi = ,j, resizeactive, 0 20
	      bindi = ,k, resizeactive, 0 -20
	      bindi = ,l, resizeactive, 20 0
      submap = escape
      submap = MONITOR
        bindi = f, focusmonitor, HDMI-0-1
        bindi = d, focusmonitor, eDP-3
      submap = escape
    '';
    
    #extraconfig = lib.mkAfter ''
    #  submap = NML
    #   bindi , ${config.kb_INS}, submap INS
    #    source $pass-onceshots
    #  submap = escape
      #FOR EACH MODE
    # submap = EXEC
    #   bindi , ${config.kb_INS}, submap INS
    #   bindi , ${config.kb_NML}, submap NML
    #   source $pass-onceshots
    # submap = escape
    #'';
      
  };
}
