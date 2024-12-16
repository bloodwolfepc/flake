{
  config = {
    globals = {
      list = {
        require-nixos = [
          "impermance"
          "ssh"
          "syncthing"
          "ripgrep"
          "src"
          "gpg"
          "sops-nix"
        ];
        require-hm = [
          "thefuck"
          "tmux"
          "zoxide"
          "zsh"
          "neovim"
          "btop"
          "git"
          "htop"
          "hyfetch"
          "fd"
          "yazi"
          "nh"
          "staging"
          "stylix"
        ];
        require-pc = [
          "hyperland"
          "rofi"
          "swaync"
          "waybar"
          "xdg"
          "lxqt-policykit"
          "cliphist"
          "wireplumber"
          "fcitx5"
          "westerm"
          "xdg"
        ];
        srv-progs = [
          "qemu"
          "podman"
        ];
        used-progs = [
          "kdeconnect"
          "sgpt"
          "feh"
          "nix-serv"
          "nix-index"
          "appimages"
          "flatpak"
          "library"
          "notebook"
          "spotify"
          "spotify-player"
          "taskwarrior"
          "xournalpp"
          "zathura"
          "qutebrowser"
          "firefox"
          "mpv"
        ];
        gaming-progs = [
          "mangohud"
          "prismlauncher"
          "steam"
          "retroarch"
          "wl-crosshair"
        ];
        workstation-progs = [
          "beeref"
          "bevy"
          "blender"
          "daw"
          "gimp"
          "krita"
          "obs"
        ];
        unused-progs = [
          "bitwarden"
          "lf" 
          "qutebrowser"
          "alacirtty"
          "freecad"
          "godot"
          "freecad"
          "kdenlive"
          "libreoffice"
          "msmtp"
          "neomutt"
          "olive-editor"
          "pass"
          "khal"
        ];
      };
    };
  };
}
