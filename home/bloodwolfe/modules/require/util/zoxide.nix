{
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
	home.persistence."/persist/home/bloodwolfe" = {
    direcotres = [
      ".local/share/zoxide"
    ];
  };
}
