{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lxqt.lxqt-policykit
  ];
}
