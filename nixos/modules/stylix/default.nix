{ pkgs, inputs, lib, config, ... }: {
  imports = [ inputs.stylix.nixosModules.stylix ];
  
  #stylix.base16Scheme = {
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #  base = "";
  #};
  
  stylix = {
    image = config.wallpaper;
    enable = true;
    base16Scheme = "${ pkgs.base16-schemes }/share/themes/windows-95.yaml";
    cursor = {
      package = pkgs.xorg.xcursorthemes; #/share/icons/handhelds
      name = "handhelds";
      size = 23;
      
    };
    fonts = {
      monospace = {
        package = pkgs.unscii;
        #package = "${ pkgs.unscii }/share/fonts/opentype/unscii-16-full.otf" ;
        #name = "unscii-16-full";
        name = "Unscii 16 Full";
      };
      sansSerif = {
        package = pkgs.unscii;
        #package = "${ pkgs.unscii }/share/fonts/opentype/unscii-16-full.otf" ;
        #name = "unscii-16-full";
        name = "Unscii 16 Full";
      };
      serif = {
        package = pkgs.unscii;
        #package = "${ pkgs.unscii }/share/fonts/opentype/unscii-16-full.otf" ;
        #name = "unscii-16-full";
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
