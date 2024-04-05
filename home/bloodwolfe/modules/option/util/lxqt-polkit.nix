{ pkgs, ... }:
{
  packages = with pkgs; [
    lxqt.lxqt-policykit
  ];
}
