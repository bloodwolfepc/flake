{
  wayland.windowManager.hyprland.settings = {
    "monitor" = "eDP-2, 2560x1600@120, 0x0, 1";
  };
  imports = [
    ./modules/option/impermanence/impermanence-home.nix #require, maybe
    ./modules/option/security/sops.nix #require
    ./modules/option/cli/security/gpg.nix #require
    ./modules/option/util/miscellaneous-utils.nix #TODO move xdg with hyprland stuff

    ./modules/require

    ./modules/preset/full-system.nix

    ./modules/option/gui/compatability/wine.nix
  ];
}
