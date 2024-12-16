

{ }
#{ lib, pkgs, config, ... }: let
#  name = "alacritty";
#  program = "${pkgs.alacritty}/bin/alacritty --command tmux";
#  bind = "t";
#in {
#  programs.alacritty = {
#  	enable = true;
#  	settings = {
#  		font = {
#        size = lib.mkForce 12.0;
#  			normal.family = lib.mkForce "unscii";
#  			normal.style = lib.mkForce "16-full";
#        italic.family = lib.mkForce "unscii";
#        italic.style = lib.mkForce "16-full";
#        bold_italic.family = lib.mkForce "unscii";
#        bold_italic.style = lib.mkForce "16-full";
#        bold.family = lib.mkForce "unscii";
#        bold.style = lib.mkForce "16-full";
#  		};
#  		window = {
#  			opacity = lib.mkForce 0.0;
#  			blur = lib.mkForce false;
#      };
#      colors.normal = {
#        black = lib.mkForce "0x181818";
#        red = lib.mkForce "0xFF0000";
#        green = lib.mkForce "0x00FF00";
#        yellow = lib.mkForce "0xFFFF00";
#        blue = lib.mkForce "0x0000FF";
#        magenta = lib.mkForce "0xFF00FF";
#        cyan = lib.mkForce "0x00FFFF";
#        white = lib.mkForce "0xFFFFFF";
#  		};
#  	};
#  };
#  wayland.windowManager.hyprland = {
#    extraConfig = lib.mkBefore ''
#	    submap = EXEC
#        bindi = , ${bind}, submap ,EXEC_${name}
#	    submap = escape
#      submap = EXEC_${name}
#        bindi = , ${config.kb_INS}, submap, INS
#        bindi = , ${config.kb_NML}, submap, NML
#	      bindi = , ${config.kb_RIGHT}, layoutmsg, preselect r
#	      bindi = , ${config.kb_DOWN}, layoutmsg, preselect d
#	      bindi = , ${config.kb_UP}, layoutmsg, preselect u
#	      bindi = , ${config.kb_LEFT}, layoutmsg, preselect l
#	      bindi = , ${config.kb_RIGHT}, exec, ${program}
#	      bindi = , ${config.kb_DOWN}, exec, ${program}
#	      bindi = , ${config.kb_UP}, exec, ${program}
#	      bindi = , ${config.kb_LEFT}, exec, ${program}
#        source = $pass-oneshots
#      submap = escape
#      submap = EXEC_WS
#        bindi = , ${bind}, workspace, name:${name}
#        bindi = , ${bind}, exec, ${program}
#      submap = escape
#      submap = WS
#        bindi = , ${bind}, workspace, name:${name}
#      submap = escape
#    '';
#  };
#}
