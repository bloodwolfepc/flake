{
  wayland.windowManager.hyprland.settings = {
    "monitor" = "DP-3, 1920x1080@60, 0x0, 1";
  };
  imports = [
    ./modules/require

    ./modules/option/cli/security/gpg.nix
    ./modules/option/util/miscellaneous-utils.nix

    ./modules/option/gui/polkit/lxqt-polkit.nix

    ./modules/option/cli/gaming/steam-tui.nix

    ./modules/option/cli/playback/sptlrx.nix
    ./modules/option/cli/playback/spotify-player.nix

    #./modules/option/gui/communitcation/discord.nix
    ./modules/option/cli/communitcation/neomutt.nix
    ./modules/option/gui/communitcation/webcord.nix

    ./modules/option/gui/playback/mpv.nix
    ./modules/option/gui/playback/zathura.nix
    ./modules/option/gui/playback/spotify.nix

    ./modules/option/gui/editors/gimp.nix
    ./modules/option/gui/editors/krita.nix
    ./modules/option/gui/editors/thunar.nix
    ./modules/option/gui/editors/reaper.nix

    ./modules/option/gui/browsers/firefox.nix

    ./modules/option/gui/compositors/hyprland.nix
    ./modules/option/gui/compositors/gamescope.nix

    ./modules/option/gui/ui/rofi.nix
    ./modules/option/gui/ui/swww.nix
    ./modules/option/gui/ui/swaync.nix
    ./modules/option/gui/ui/waybar.nix
    ./modules/option/gui/ui/alacritty.nix
    ./modules/option/gui/ui/grimblast.nix

    ./modules/option/gui/compatability/wine.nix

    ./modules/option/gui/gaming/lutris.nix
    ./modules/option/gui/gaming/gaming-utils.nix
    #./modules/option/gui/gaming/retroarch.nix
    #./modules/option/gui/gaming/ryujinx.nix

    ./modules/option/gui/theme/darktop/fonts.nix
    ./modules/option/gui/theme/darktop/gtk.nix
  ];
}
