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
		];
		files = [
			"/etc/machine-id"
		  "/var/lib/sops-nix/key.txt"
			{ file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
		];
	};
}
