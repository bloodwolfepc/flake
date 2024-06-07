{
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
			".nixops"
			".local/share/keyrings"
			".local/share/direnv"
      ".cache/mozilla"
      ".mozilla"
      ".wine"
      ".local/share/Steam"
      ".local/share/zoxide"
      ".local/share/krita" 
      ".local/share/bottles"
      ".config/spotify"
      ".config/falkTX" 
      ".config/GIMP"
      ".config/obs-studio" 
      ".config/REAPER"
      ".config/ardour8"
      ".cache/spotify-player" #TODO replace with EOF shell scirpt 
      ".cache/ardour8"
      
      ".local/state/wireplumber"

			"music"
			"videos"
      "projects"
      "wine"

      "pictures/snips" #TODO couple these with syncting in their respective configs
      "pictures/gallery"
      "documents/notebook"
      "documnets/gimp"
      "documents/krita"
      "documnets/reaper"
      "documents/ardour"
      "documents/kdenlive"
		];
		files = [
      ".config/gh/hosts.yml" #TODO place this somewhere less worse
			".screenrc" 
      ".ssh/known_hosts"
      
      ".config/kritarc"
      ".config/kritadisplayrc"
		];
		allowOther = true;
	};
  systemd.user.services."home-bloodwolfe-extra-directory-creation" = {
    Install = {
      wantedBy = [ "default.target" ];
    };
    Unit = {
      Description = "Create extra directores";
    };
    Service = {
      Type = "oneshot";
      script = ''
        #xargs -d '\n' -I mkdir -p {} <<EOF
        xargs -I {} mkdir -p "/home/bloodwolfe/{}" <<EOF
        downloads
        EOF
      '';
    };
  };
  systemd.user.sessionVariables = {
    XDG_DOWNLOAD_DIR = "/home/bloodwolfe/downloads";
  };
}
