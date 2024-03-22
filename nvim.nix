{ config, lib, ... }:
{
programs.neovim = {
  enable = true;
  defaultEditor = true;
  coc.enable = true;
  plugins = with pkgs; [

  ];


#nerdcommenter
#comment-box


