{
  monitors = import ./monitors.nix;
  #keybinds = import ./keybinds.nix;
  extra-options = import ./extra-options.nix;
  pass-secret-service = import ./pass-secret-service.nix;
}
