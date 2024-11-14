{ pkgs, inputs, lib, config, ... }: {
  #home-manager.users."bloodwolfe" = {
  #  stylix.targets.xyz.enable = false;
  #};
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {
    image = config.wallpaper;
    enable = true;
    #simpleJPC16 -> https://pixeljoint.com/pixelart/119844.htm
    #base16Scheme = {
    #  base00 = "050403";
    #  base01 = "221F31";
    #  base02 = "543516";
    #  base03 = "98632D";
    #  base04 = "E1B047";
    #  base05 = "F5EE9B";
    #  base06 = "FEFEFE";
    #  base07 = "8BE1E0";
    #  base08 = "7CC264";
    #  base09 = "678FCB";
    #  base0A = "316F23";
    #  base0B = "404A68";
    #  base0C = "A14D3F";
    #  base0D = "A568D4";
    #  base0E = "9A93B7";
    #  base0F = "EA9182";
    #};
    base16Scheme = "${ pkgs.base16-schemes }/share/themes/windows-95.yaml";
    cursor = {
      package = pkgs.xorg.xcursorthemes; #/share/icons/handhelds
      name = "handhelds";
      size = 23;
    };
    fonts = {
      monospace = {
        package = pkgs.unscii;
        name = "Unscii 16 Full";
      };
      sansSerif = {
        package = pkgs.unscii;
        name = "Unscii 16 Full";
      };
      serif = {
        package = pkgs.unscii;
        name = "Unscii 16 Full";
      }; 
      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "noto monochrome emoji";
      };
    };
    polarity = "dark";   
    targets.plymouth = {
      enable = true;
      #logo =
      #logoAnimated =
    };
    targets.nixos-icons.enable = true;
    targets.console.enable = true;
    targets.gtk.enable = true; 
  }; 
}
