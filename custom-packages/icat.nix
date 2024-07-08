{ lib, stdenv, fetchFromGitHub, imlib2, xorg }:

stdenv.mkDerivation {
  pname = "icat";
  version = "v0.5";
  src = fetchFromGitHub {
    owner = "atextor";
    repo = "icat";
    rev = "v0.5";
    #nix-prefetch-url --type sha256 --unpack <url>
    sha256 = "0wyy2ksxp95vnh71ybj1bbmqd5ggp13x3mk37pzr99ljs9awy8ka";
  };
  buildInputs = [ imlib2 xorg.libX11.dev ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin 
    cp icat $out/bin 
    runHook postInstall 
    '';
}
    




