{ pkgs, ... }: {
  imports = [
    ./mangohud.nix
    ./hyprland.nix
    ./wl-crosshair.nix
  ];
  home.packages = with pkgs; [
    vkbasalt
    vkbasalt-cli
    vulkan-tools
    vrrtest
  ];
  home.persistence."/sync/home/bloodwolfe" = {
    directories = [
      "library"
      "notebook"
      "snippets"
    ];
  };
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".config/Moonlight Game Streaming Project"
      ".config/sunshine"
    ];
  };
}

#lutris
#easyrpg-player
#itch
#ryujinx

