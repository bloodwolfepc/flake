{ pkgs, ... }: {
  home.packages = with pkgs; [
   zathura
  ];
  home.persistence."/sync/home/bloodwolfe" = {
    directories = [
      ".local/share/zathura"
    ];
  };
}
