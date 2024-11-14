{ pkgs ? import <nixpkgs> }:
{
  hello = pkgs.callPackage ./hello.nix { };
  icat = pkgs.callPackage ./icat.nix { };
  crossover = pkgs.callPackage ./crossover.nix { };
  openutau = pkgs.callPackage ./openutau.nix { };
  rofi-pass = pkgs.callPackage ./pass-wofi { };
  #beeref = pkgs.callPackage ./beeref { };
  doukutsu-rs = pkgs.callPackage ./doukutsu-rs { };
  bandcamp-dl = pkgs.callPackage ./bandcamp-dl { };

}
