{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "stylix";
    inherit config;
    inherit extraConfig;
  }; 
  #base16Scheme = {
    #base00 = "050403";
    #base01 = "221F31";
    #base02 = "543516";
    #base03 = "98632D";
    #base04 = "E1B047";
    ##base05 = "F5EE9B"; 
    #base05 = "FFFFFF";
    #base06 = "FEFEFE";
    #base07 = "8BE1E0";
    #base08 = "7CC264";
    #base09 = "678FCB";
    #base0A = "316F23";
    #base0B = "404A68";
    #base0C = "A14D3F";
    #base0D = "A568D4";
    #base0E = "9A93B7";
    #base0F = "EA9182";
  #}
  extraConfig = {
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
  };
in {
  inherit (attrs) options config;
}

