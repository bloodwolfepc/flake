{ pkgs, ... }: {
  imports = [
    ./mangohud.nix
    ./hyprland.nix
  ];
  home.packages = with pkgs; [
    vkbasalt
    vkbasalt-cli
    #glfw-wayland-minecraft
    
    #lutris
    retroarch
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
    #borg backup
    #create hoted xyz with UUID whitelist
    #ferium with nix integration in /sync
    #worry about lattest version first

    
    
  ];
  home.persistence."/sync/home/bloodwolfe" = {
    directories = [
      "rpgmaker"
      ".config/retroarch"
      ".local/share/PrismLauncher/instances"
      ".config/ferium"
      ".local/share/packwiz"
    ];
  };
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".local/share/Steam"
    ];
    files = [
      ".local/share/PrismLauncher/prismlauncher.cfg"
      ".local/share/PrismLauncher/accounts.json"
      ".local/share/PrismLauncher/metacache"
    ];
  };
}
