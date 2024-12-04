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
#customPackages = forEachSystem (pkgs: import ./packages { inherit pkgs; });

#systems = [
#  "x86_64-linux"
#];
#lib = nixpkgs.lib // home-manager.lib;
#forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
#pkgsFor = lib.genAttrs systems (system: import nixpkgs {
#	inherit system;
#	config.allowUnfree = true;
#});
