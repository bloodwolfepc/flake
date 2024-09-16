{ pkgs, ... }: {
  networking.wireguard = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    wireguard-tools 
  ];
  sops.secrets."wg.conf" = {
    format = "binary";
    sopsFile = ../../../secrets/wg.conf;
  };
}
