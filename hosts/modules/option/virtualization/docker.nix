{
  virtualisation.docker.enable = true;
	environment.persistence."/persist/system" = {
		directories = [
      "/var/lib/docker"
    ];
  };
}
