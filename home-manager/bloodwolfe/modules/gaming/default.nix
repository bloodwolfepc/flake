{ pkgs, ... }: {
  imports = [
    ./mangohud.nix
    ./hyprland.nix
  ];
  home.packages = with pkgs; [
    vkbasalt
    vkbasalt-cli
    prismlauncher
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
  ];
  home.persistence."/sync/home/bloodwolfe" = {
    directories = [
      "rpgmaker"
      ".config/retroarch"
      ".local/share/PrismLauncher/instances"
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
