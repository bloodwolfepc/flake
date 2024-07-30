{ lib, pkgs, ... }: {
  programs.alacritty = {
  	enable = true;
  	settings = {
  		font = {
  			normal.family = lib.mkForce "unscii";
  			normal.style = lib.mkForce "16-full";
  		};
  		#window = {
  		#	opacity = 0.0;
  		#	blur = false;
      #};
      #colors.normal = {
      #  black = "0x181818";
      #  red = "0xFF0000";
      #  green = "0x00FF00";
      #  yellow = "0xFFFF00";
      #  blue = "0x0000FF";
      #  magenta ="0xFF00FF";
      #  cyan = "0x00FFFF";
      #  white = "0xFFFFFF";
  		#};
  	};
  };
  wayland.windowManager.hyprland = {
    extraconfig = lib.mkBefore ''
	    submap = EXEC
	      bindi = , h, layoutmsg, preselect r
	      bindi = , j, layoutmsg, preselect d
	      bindi = , k, layoutmsg, preselect u
	      bindi = , l, layoutmsg, preselect l
	      bindi = , h, exec, ${pkgs.alacirtty}/bin/alacritty --command tmux
	      bindi = , j, exec, ${pkgs.alacritty}/bin/alacritty --command tmux
	      bindi = , k, exec, ${pkgs.alacritty}/bin/alacritty --command tmux
	      bindi = , l, exec, ${pkgs.alacritty}/bin/alacritty --command tmux
	    submap = escape
    '';
  };
}
