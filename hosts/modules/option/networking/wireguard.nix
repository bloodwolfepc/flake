{ pkgs, ... }: {
  networking.wireguard = {
    enable = true;
  };
#TODO setup a vps
  environment.systemPackages = with pkgs; [
    wgnord
  ];
}
