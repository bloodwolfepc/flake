{ inputs, outputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager #gets homemanager
    ./locale.nix
    ./nix.nix
  ] ++ (builtins.attrValues outputs.customNixosModules); #concatenate customNixosModules

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config.allowUnfree = true;
  };

  hardware.enableRedistibutableFirmware = true;
  security.sudo.extraconfig = ''
    Defaults timestamp_timeout = 120
  '';
}
