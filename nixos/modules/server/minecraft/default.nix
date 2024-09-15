#host all servers
{
  imports = [
   ./proxy-mc.nix
   ./vanilla-mc.nix
   ./xyz-mc.nix
  ];
}
