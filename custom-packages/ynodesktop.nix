{ lib, stdenv, fetchFromGitHub, yarn2nix, }:

stdenv.mkDerivation {
  pname = "ynodesktop";
  version = "v1.1.3";
  src = fetchFromGitHub {
    owner = "atextor";
    repo = "ynodeskitop";
    rev = "v1.1.3";
    sha256 = "051sxhqsviy4vax8pp6kcby34mh02p0jlf01ificvh99dag2kryy";
  };
  buildInputs = [ yarn2nix ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin 
    cp icat $out/bin 
    runHook postInstall 
    '';
}
    




