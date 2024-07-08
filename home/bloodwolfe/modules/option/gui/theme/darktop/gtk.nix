{ pkgs, ... }:
{
  gtk = {
    enable = true;
    #font = "Unscii";
    #iconTheme = "rose-pine-icons";
    #theme = "rose-pine-gtk";
    theme.package = pkgs.rose-pine-gtk-theme;
    theme.name = "rose-pine-gtk"; #TODO fix themes
  };
}
