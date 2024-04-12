
{ pkgs, ... }:
{
  home.packages = with pkgs; [
   webcord-vencord
   discord-rpc
   discord-gamesdk
  ];
}
