{ pkgs ? import <nixpkgs> }:
{
  hello = pkgs.callPackage ./hello.nix { };
  icat = pkgs.callPackage ./icat.nix { };

}
