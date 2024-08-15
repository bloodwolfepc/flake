{ pkgs, inputs, lib, config, ... }: {
  #imports = [ inputs.stylix.homeManagerModules.stylix ]; #the system level input handles this
  stylix = {
    image = config.wallpaper;
    enable = true;
    base16Scheme = "${ pkgs.base16-schemes }/share/themes/windows-95.yaml";
    #cursor = {
    #  package = pkgs.x;
    #  name = "";
    #};
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

    #enable = true;
    #image = ../../../../assets/wallpapers/Black.png;
    ##base16Scheme = lib.mkForce "${ pkgs.base16-schemes }/share/themes/windows-95.yaml";
    ##cursor = {
    ##  package
    ##  name
    ##  size
    ##};
    #fonts = {
    #  packages = with pkgs; [ unscii ];
    #  emoji = {
    #    package = pkgs.noto-fonts-monochrome-emoji;
    #    name = "Noto Monochrome Emoji";
    #  };
    #};
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
