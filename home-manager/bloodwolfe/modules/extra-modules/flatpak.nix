{
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".cache/flatpak"
      ".local/share/flatpak"
      # an issue with bwrap and impermanence 
      # where steam is not be able to find and write some stuff
      # even with elevated permissions
      # this is exclusive to the impermanence module bindmounts
      # and is temporaraly resolved with a btrfs
      # subvolume called flatpak that is mounted to .var/app
      
      #".var/app/com.valvesoftware.Steam
      
      #".var/app/com.valvesoftware.Steam/.local/share/data
      #".var/app/com.valvesoftware.Steam/.steam
    ];
  };
}
