{ pkgs, lib, config, ... }: {
  home.packages = with pkgs; [
    vesktop
  ];
	home.persistence."/persist${config.home.homeDirectory}" = {
		directories = [
      ".config/vesktop"
    ];
  };

  #options = {
  #  configured.vesktop.enable = lib.mkEnableOption "enable configured vesktop";
  #  configured.vesktop.persist.enable = lib.mkEnableOption "enable vesktop persist";
  #};
  #config = lib.mkIf config.configured.vesktop.enable {
  #  home.packages = with pkgs; [
  #    vesktop
  #  ];
  #};
  #config = lib.mkIf config.configured.vesktop.persist.enable {
	#  home.persistence."/persist${config.home.homeDirectory}" = {
	#  	directories = [
  #      ".config/vesktop"
  #    ];
  #  };
  #};
}
