{
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".local/share/Steam"
    ];
  };
  wayland.windowManager.hyprland = let
    name = "games";
  in {
    settings.windowrulev2 = [
      "float, class:^([Ss]team)$, title:^((?![Ss]team).*)$"
      "workspace name:${name} silent, class:^([Ss]team)$, title:^([Ss]team)$"
      "tile, class:^([Ss]team)$, title:^([Ss]team)$"
      "workspace name:${name} silent, class:^([Ss]special [Oo]ffers)$, title:^([Ss]special [Oo]ffers)$"
      #"Special Offers"
      #"Sign in to Steam"
    ];
  };
}
