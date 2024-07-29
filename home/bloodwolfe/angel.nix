{
  wayland.windowManager.hyprland.settings = {
    "monitor" = [
      "eDP-2, 2560x1600@60, 0x0, 1"
     #"HDMI-A-1, 1920x1080@60, -2560x0, 1" # vrr, 1"
      #"eDP-2, 1920x1080@60, 0x0, 1"
      #"HDMI-A-1, 1920x180@75, -1920x0, 1"
      ",preferred,auto,1"
    ];
  };
  imports = [
    ./modules/option/impermanence/impermanence-home.nix #require, maybe
    ./modules/option/security/sops.nix #require
    ./modules/option/cli/security/gpg.nix #require
    ./modules/option/util/miscellaneous-utils.nix #TODO move xdg with hyprland stuff

    ./modules/require

    ./modules/preset/full-system.nix

    ./modules/option/gui/compatability/wine.nix


    ./modules/option/gui/communitcation/kdeconnect.nix
    ./modules/option/style/stylix.nix
    ./modules/daw
  ];
}
