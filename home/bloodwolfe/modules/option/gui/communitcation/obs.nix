{ pkgs, ... }:
{
  home.packages = with pkgs; [
   obs-studio
   obs-cli
   obs-studio-plugins.obs-3d-effect
   obs-studio-plugins.input-overlay
   obs-studio-plugins.obs-tuna
  ];
}
