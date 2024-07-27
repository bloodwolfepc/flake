{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
  ]; 
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".local/share/PrismLauncher"
    ];
  };
}
