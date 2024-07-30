{ pkgs, ... }: {
  imports = [
    ./mangohud.nix
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
  ];
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".local/share/PrismLauncher"
      ".local/share/Steam"
    ];
  };
}
