{ lib, config, pkgs, inputs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "impermanence";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    home.persistence."/sync/home/bloodwolfe" = {
      allowOther = true;
    };
    home.persistence."/persist/home/bloodwolfe" = {
      allowOther = true;
    };
  };
in {
  inherit (attrs) options config;
	imports = [
		inputs.impermanence.nixosModules.home-manager.impermanence
	];
}
