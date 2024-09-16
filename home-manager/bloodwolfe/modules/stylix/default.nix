{ pkgs, inputs, lib, config, ... }: {
  #imports = [ inputs.stylix.homeManagerModules.stylix ];
  #this is needed for the standalone home-manager command but the system will not build if its imported
  stylix = {
    image = config.wallpaper;
    enable = true;
    base16Scheme = "${ pkgs.base16-schemes }/share/themes/windows-95.yaml";
    cursor = {
      package = pkgs.xorg.xcursorthemes; #/share/icons/handhelds
      name = "handhelds";
      size = 23;
    };
    fonts = {
      monospace = {
        package = pkgs.unscii;
        name = "Unscii";
      };
      sansSerif = {
        package = pkgs.unscii;
        name = "Unscii";
      };
      serif = {
        package = pkgs.unscii;
        name = "Unscii";
      }; 
      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Monochrome Emoji";
      };
    };
    polarity = "dark";   
    targets = {
      alacritty = {
        enable = true;
      };
      btop = {
        enable = true;
      };
      firefox = {
        enable = true;
      };
      fzf = {
        enable = true;
      };
      gtk.enable = true;
      hyprland = {
        enable = true;
      };
      kde.enable = true;
      mangohud.enable = true;
      rofi.enable = true;
      tmux.enable = true;
      vesktop.enable = true;
      vim.enable = true;
      waybar.enable = true;
    };
  };
}
