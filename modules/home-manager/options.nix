{ lib, ... }: {
  options = {
    wallpaper = lib.mkOption {
      default = "$FLAKE/assets/wallpapers/black.png";
      type = lib.types.str;
    };
  };
}
