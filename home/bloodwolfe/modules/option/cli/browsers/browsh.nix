{ pkgs, ... }:
{
  home.packages = with pkgs; [
    browsh
#TODO this has a config file that can be setup
#environment.etc."fwupd/uefi_capsule.conf".text = pkgs.lib.mkForce ''
  ];
}
