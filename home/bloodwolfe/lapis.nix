{ inputs, lib, pkgs, config, outputs, ... }:
{
  imports = [
    ./modules/require
    ./modules/option/desktop
  ];
}
