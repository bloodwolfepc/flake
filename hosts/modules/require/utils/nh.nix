{ config, pkgs, ... }:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keee-since 4d --keep 3";
    flake = "/home/bloodwolfe/Projects/flake";
  };
  enviornment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
