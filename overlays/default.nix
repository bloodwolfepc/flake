{ inputs, ... }:
{
  #lib2 = prev: final: import ../lib/lib2.nix { lib = prev.lib pkgs = prev; };

  additions = final: _prev: import ../packages { pkgs = final; };
  modifications = final: prev: {
    neovim = prev.neovim // {
      neovim = inputs.nixvim.packages.x86_64-linux.default;
    };
  };
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
