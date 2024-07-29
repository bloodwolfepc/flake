{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    exec-once = [
      "hyprctl dispatch workspace name:main"
      "alacritty --command tmux"
    ];
    extraconfig = ''
      submap = EXEC
        bindi = , j, workspace, name:termfox
        bindi = , j, exec ${pkgs.firefox}/bin/firefox
        bindi = , j, exec ${pkgs.alacritty}/bin/alacritty --command tmux
      submap = escape
      submap = GLOBAL
        bindi = , k, workspace, name:main
        bindi = , j, workspace, name:termfox
      submap = escape
    '';
  };
}
