{ inputs, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    XDG_SCREENSHOTS_DIR = "/home/bloodwolfe/pictures/snips";
  };
}

