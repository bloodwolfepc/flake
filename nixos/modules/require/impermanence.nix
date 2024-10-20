{
	fileSystems."/persist".neededForBoot = true;
	environment.persistence."/persist/system" = {
		hideMounts = true;
		directories = [
    #"/data"
		"/etc/nixos"
		"/var/log"
		"/var/lib/nixos"
		"/var/lib/bluetooth"
		"/var/lib/systemd/coredump"
		"/etc/NetworkManager/system-connections"
    #{ directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
      {
        directory = "/var/lib/flatpak";
        user = "root";
        group = "root";
        mode = "0755";
      }
    ];
		files = [
			"/etc/machine-id"
			{ file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
		];
	};
}
