{ pkgs, ... }: {
  home.packages = with pkgs; [
    goverlay
    vkbasalt
    vkbasalt-cli
  ];
}
