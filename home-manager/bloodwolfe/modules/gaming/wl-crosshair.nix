{ inputs, ... }: {
  home.packages = [
    inputs.wl-crosshair.packages.x86_64-linux.default
  ];
}
