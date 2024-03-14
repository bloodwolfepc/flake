{ config, lib, pkgs, ... }:



let
inherit (config.lib.formats.rasi) mkLiteral;
in
{
programs.rofi = {
	enable = true;
	font = "unscii";
	location = "bottom-left";
	theme = {
		"#window" = {
			children = map mkLiteral [ "horibox" ];
		};
		"#horibox" = {
			chilren = map mkLiteral [ "prompt" "textbox-promt-colon" "entry" "listview" ];
		};
		"#mainbox" = {
			children = map mkLiteral [ "inputbar" "message" "listview" "mode-switcher" ];
		};
		"#inputbar" = {
			children = map mkLiteral [ "promp" "entry" ];
		};
		#listview = {
		#	enabled = true;
		#	layout = "horizontal";
		#};
	};
};
}
