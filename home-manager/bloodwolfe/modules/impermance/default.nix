{ lib, config, pkgs, inputs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "impermanence";
    inherit config;
    inherit extraHomeConfig;
  }; 
  extraHomeConfig = {
    persistence."/sync/home/bloodwolfe" = {
      allowOther = true;
    };
    persistence."/persist/home/bloodwolfe" = {
      allowOther = true;
    };
  };
in {
  inherit (attrs) options config;
	imports = [
		inputs.impermanence.nixosModules.home-manager.impermanence
	];
}
