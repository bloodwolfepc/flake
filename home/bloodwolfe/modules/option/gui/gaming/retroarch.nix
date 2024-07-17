{ pkgs, ... }: {
  home.packages = with pkgs; [
   retroarch #includes cores
   retroarch-assets
   retroarch-joypad-autoconfig



  #these just get tossed here
   easyrpg-player
   itch

   
  ];
}
