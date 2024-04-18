{
	fileSystems."/persist".neededForBoot = true;
	environment.persistence."/persist/system" = {
		hideMounts = true;
		directories = [
		"/etc/nixos"
		"/var/log"
		"/var/lib/nixos"
		"/var/lib/bluetooth"
		"/var/lib/systemd/coredump"
		"/etc/NetworkManager/system-connections"
    "/etc/ssh"
    { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
		];
		files = [
			"/etc/machine-id"
			{ file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
		];
	};
}
