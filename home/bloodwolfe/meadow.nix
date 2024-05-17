{
  #wayland.windowManager.hyprland.settings = {
    #"monitor" = "DP-3, 1920x1080@144, 0x0, 1"; # vrr, 1"; vrr works a little whack on this monitor
  #};
  imports = [
    #./modules/option/impermanence/impermanence-home.nix #require, maybe
    ./modules/option/security/sops.nix #require
    ./modules/option/cli/security/gpg.nix #require
    ./modules/option/util/miscellaneous-utils.nix #TODO move xdg with hyprland stuff

    ./modules/require

    ./modules/preset/iso.nix

    #./modules/option/gui/compatability/wine.nix
  ];
}
