{
  imports = [
    ./modules/require

    ./modules/option/util/miscellaneous-utils.nix
    ./modules/option/util/steam.nix
    ./modules/option/util/lxqt-polkit.nix

    ./modules/option/cli/gaming/steam-tui.nix
    ./modules/option/cli/playback/sptlrx.nix
    ./modules/option/cli/playback/spotify-player.nix
    ./modules/option/cli/communitcation/neomutt.nix

    ./modules/option/gui/gaming/gamescope.nix
    ./modules/option/gui/communitcation/discord.nix
    ./modules/option/gui/playback/mpv.nix
    ./modules/option/gui/playback/spotify.nix
    ./modules/option/gui/editors/gimp.nix
    ./modules/option/gui/editors/krita.nix
    ./modules/option/gui/editors/thunar.nix
    ./modules/option/gui/browsers/firefox.nix

    ./modules/option/gui/desktop-environment/hyprland.nix

    ./modules/option/gui/desktop-ui/rofi.nix
    ./modules/option/gui/desktop-ui/swww.nix
    ./modules/option/gui/desktop-ui/swaync.nix
    ./modules/option/gui/desktop-ui/waybar.nix
    ./modules/option/gui/desktop-ui/alacritty.nix
    ./modules/option/gui/desktop-ui/grimblast.nix

    ./modules/option/gui/theme/darktop/fonts.nix
  ];
}
