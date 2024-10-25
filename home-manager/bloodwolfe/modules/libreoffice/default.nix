{ pkgs, config, ... }: {
  home.packages = with pkgs; [
   libreoffice-qt
   hunspell
   hunspellDicts.en_US
   foliate
  ];
	home.persistence."/sync${config.home.homeDirectory}" = {
    directories = [
      ".config/libreoffice"
    ];
  };
}
