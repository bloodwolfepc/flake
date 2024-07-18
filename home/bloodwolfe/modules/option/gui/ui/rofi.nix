{ config, lib, pkgs, ... }:
let
inherit (config.lib.formats.rasi) mkLiteral;
in
{
programs.rofi = {
	enable = true;
  package = pkgs.rofi-wayland-unwrapped;
	#package = pkgs.rofi.override { plugins = with pkgs; [
	#rofi
	#]; };
	#plugins = with pkgs; [
	#rofi-emoji
	#rofi-calc
	#rofi-systemd
	#];
	#terminal = "alacritty";
	#font = "Unscii 12";
	location = "top";
	theme = {	
		"*" = {
			#background-color = mkLiteral "#000000";
		};
		"#window" =  {
			children = map mkLiteral [ "mainbox" ];
			width = mkLiteral "100%";
			height = mkLiteral "1.80%";
		};
		"#mainbox" = {
			children = map mkLiteral [ "inputbar" ];
			spacing = mkLiteral "0px";
		};
		"#inputbar" = {
			children = map mkLiteral [ "entry" "listview"];
			#spacing = mkLiteral "10px";
		};
		"#listview" = {
			expand = mkLiteral "true";
			dynamic = mkLiteral "true";
			layout = mkLiteral "horizontal";
			children = map mkLiteral [ "element" ];
			columns = mkLiteral "3";
			spacing = mkLiteral "2px";
			lines = mkLiteral "20";
			width = "80%";
			margin = mkLiteral "0px";
			border = mkLiteral "1px";
			padding = mkLiteral "0px";
			#font = "Unscii";
		};
		"#entry" = {
			expand = mkLiteral "false";
			placeholder = "";
			#text-color = mkLiteral "#ffffff";
			blink = mkLiteral "true";
			width = mkLiteral "20%";
			margin = mkLiteral "0px";
			border = mkLiteral "1px";
			padding = mkLiteral "0px";
		};
		"#element" = {
			children = map mkLiteral [ "element-text" ];
			orientation = mkLiteral "horizontal";
			padding = mkLiteral "0px";
			
		};
		"#element-text" = {
			expand = mkLiteral "true";
			#text-color = mkLiteral "#ffffff";
		};
	};
};
}
