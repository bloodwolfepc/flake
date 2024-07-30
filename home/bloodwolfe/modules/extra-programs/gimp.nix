{ pkgs, ... }: {
  home.packages = with pkgs; [
    gimp
  ];
	home.persistence."/persist/home/bloodwolfe" = {
    directores = [ 
      ".config/GIMP"
    ];
  };  
}
  
  #pkgs.gimp.configPackages = [
  #  (pkgs.writeTextDir "/home/bloodwolfe/.config/GIMP/2.10/gimprc" ''
  #    (toolbox-groups no)
  #  '');
  #];
