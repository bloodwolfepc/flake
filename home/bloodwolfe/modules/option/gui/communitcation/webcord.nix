{ pkgs, ... }: {
  home.packages = with pkgs; [
   #webcord-vencord
   
   vesktop
   
   #discord-rpc
   #discord-gamesdk
   
  #(discord.override { 
  #  withOpenASAR = true;
  #  withVencord =  true;
  #})
  ];
}
