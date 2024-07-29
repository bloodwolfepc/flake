{ lib, ... }: {
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
}
