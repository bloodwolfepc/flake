{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
  ];
  #pkgs.gimp.configPackages = [
  #  (pkgs.writeTextDir "/home/bloodwolfe/.config/GIMP/2.10/gimprc" ''
  #    (toolbox-groups no)
  #  '');
  #];
}
