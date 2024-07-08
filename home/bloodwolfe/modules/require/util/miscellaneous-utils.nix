{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tree
    ctags
    fzf

    sops
    
    tldr



    lolcat
    gay
    neofetch

    #TODO temporary placement
    soundfont-fluid
    #soundfont-arachno
  ];
}
