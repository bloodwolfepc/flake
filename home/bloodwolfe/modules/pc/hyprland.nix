{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      
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
      };
	    dwindle = {
	      pseudotile = true;
	      preserve_split = true;
	      permanent_direction_override = true;
	    };
	    input = {
	      kb_layout = "us";
	      follow_mouse = "1";
	      sensitivity = "0";
	      accel_profile = "flat";
	    };
    };
  };
}
