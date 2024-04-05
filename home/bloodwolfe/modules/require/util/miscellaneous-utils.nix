{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tree
    ctags
    
    tldr



    lolcat
    gay
    neofetch
    hyfetch
  ];
}
