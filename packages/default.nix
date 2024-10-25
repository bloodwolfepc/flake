{ pkgs ? import <nixpkgs> }:
{
  hello = pkgs.callPackage ./hello.nix { };
  icat = pkgs.callPackage ./icat.nix { };
  crossover = pkgs.callPackage ./crossover.nix { };
  openutau = pkgs.callPackage ./openutau.nix { };

}
