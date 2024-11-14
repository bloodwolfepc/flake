{ pkgs, ... }: {
  home.packages = with pkgs; [
    zathura
    xournalpp
  ];
  home.persistence."/sync/home/bloodwolfe" = {
    directories = [
      ".local/share/zathura"
      ".config/xournalpp"
    ];
  };
}
