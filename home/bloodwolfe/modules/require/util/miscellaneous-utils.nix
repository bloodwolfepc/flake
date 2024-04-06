{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tree
    ctags

    sops
    
    tldr



    lolcat
    gay
    neofetch
  ];
}
