{ pkgs, inputs, lib, ... }: {
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
    image = ../../../../assets/wallpapers/Black.png;
    enable = true;
    base16Scheme = lib.mkForce "${ pkgs.base16-schemes }/share/themes/windows-95.yaml";
    #cursor = {
    #  package = pkgs.x;
    #  name = "";
    #};
    fonts = {
      monospace = {
        package = pkgs.unscii;
        name = "Unscii";
      };
      sansSerif = {
        package = pkgs.unscii;
        name = "Unscii";
      };
      serif = {
        package = pkgs.unscii;
        name = "Unscii";
      }; 
    };
    polarity = "dark";   
  };
    
  
}
