{ pkgs, ... }: {
  imports = [
    ./mangohud.nix
    ./hyprland.nix
    ./crossover.nix
  ];
  home.packages = with pkgs; [
    vkbasalt
    vkbasalt-cli
    #glfw-wayland-minecraft
    
    #lutris
    (retroarchFull.override {
      cores = with libretro; [
        play
        swanstation
        pcsx-rearmed
        beetle-psx
        snes9x
        pcsx2
        dolphin
        desmume
        bsnes
      ];
    })
    retroarch-assets
    retroarch-joypad-autoconfig
    easyrpg-player
    itch
    #ryujinx

    #GRAPHICS UTILS
    vulkan-tools
    vrrtest

    #minecraft
    (prismlauncher.override {
      jdks = [ jdk jdk17 jdk8 ];
      gamemodeSupport = true;
    })
    vlc
    #modrinth-app
    ferium
    packwiz
    #TODO
    #create hoted xyz with UUID whitelist

    
    
  ];
  home.persistence."/sync/home/bloodwolfe" = {
    directories = [
      "games"
      "rpgmaker"
      ".config/retroarch/saves"
      ".config/retroarch/states"
      ".config/retroarch/screenshots"
      ".local/share/PrismLauncher/instances"
      ".config/ferium"
      ".local/share/packwiz"
      "library"
      "notebook"
    ];
  };
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".local/share/Steam"
      ".config/Moonlight Game Streaming Project"
      ".config/sunshine"
      ".local/share/PrismLauncher/libraries"
      ".local/share/PrismLauncher/assets"
    ];
    files = [
      ".local/share/PrismLauncher/prismlauncher.cfg"
      ".local/share/PrismLauncher/accounts.json"
      ".local/share/PrismLauncher/metacache"
    ];
  };
}
