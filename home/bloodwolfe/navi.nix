{ pkgs, ... }: {
  imports = [
    ./modules/option/impermanence/impermanence-home.nix #require, maybe
    ./modules/option/security/sops.nix #require
    ./modules/option/cli/security/gpg.nix #require
    ./modules/option/util/miscellaneous-utils.nix #TODO move xdg with hyprland stuff

    ./modules/require

    ./modules/preset/navi.nix

    #./modules/option/gui/compatability/wine.nix
  ];
  home.packages = [ pkgs.dconf ];
}
