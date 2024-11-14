{
  lib,
  stdenv,
  makeWrapper,
  pass,
  jq,
  rofi,
  libnotify,
  wl-clipboard,
  wtype,
  findutils,
  gnused,
  coreutils,
}:
  stdenv.mkDerivation {
    name = "pass-rofi";
    version = "1.0";
    src = ./pass-rofi.sh;

    nativeBuildInputs = [makeWrapper];

    dontUnpack = true;
    dontBuild = true;
    dontConfigure = true;

    installPhase = ''
      install -Dm 0755 $src $out/bin/pass-rofi
      wrapProgram $out/bin/pass-rofi --prefix PATH ':' \
        "${
        lib.makeBinPath [
          pass
          jq
          rofi
          libnotify
          wl-clipboard
          wtype
          findutils
          gnused
          coreutils
        ]
      }"
    '';

    meta = {
      description = "A rofi graphical menu for pass";
      license = lib.licenses.mit;
      platforms = lib.platforms.all;
      mainProgram = "pass-rofi";
    };
  }
