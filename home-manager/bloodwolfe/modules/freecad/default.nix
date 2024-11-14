{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    freecad
  ];
	home.persistence."/sync${config.home.homeDirectory}" = {
    directories = [
      ".config/freecad"
    ];
  };
}
