{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    krita
  ];
  
  #syncthing will not sync single files and krita cannot change rc location (i dont think)
  #this will need to be a symlink
  home.file.".config/kritarc".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/DIR-kritarc/kritarc";
  home.file.".config/kritadisplayrc".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/DIR-kritadisplayrc/kritadisplayrc";
    
	home.persistence."/sync/home/bloodwolfe" = {
    directories = [
      "krita"
      ".local/share/krita" 
      ".config/DIR-kritarc"
      ".config/DIR-kritadisplayrc"
    ];
  };
}
