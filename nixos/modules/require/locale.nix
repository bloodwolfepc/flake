{ lib, pkgs, ... }: {
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
      "ko_KR.UTF-8/UTF-8"
    ];
    #inputMethod = {
    #  enable = true;
    #  type = "fcitx5";
    #  fcitx5 = {
    #    waylandFrontend = true;
    #    ignoreUserConfig = true;
    #    addons = with pkgs; [
    #      fcitx5-mozc
    #      fcitx5-gtk
    #      #fcitx5-nord
    #      #fcitx5-table-other
    #      #fcitx5-hangul
    #      #fcitx5-lua
    #    ];
    #    #inputs = [
    #    #  {
    #    #    name = "Default";
    #    #    defaultLayout = "us";
    #    #    defaultIM = "mozc";
    #    #    items = [
    #    #      {
    #    #        name = "keyboard-us";
    #    #      }
    #    #      {
    #    #        name = "mozc";
    #    #      }
    #    #    ];
    #    #  }
    #    #];
    #  };
    #};
  };
  time.timeZone = lib.mkDefault "America/Chicago";
}
