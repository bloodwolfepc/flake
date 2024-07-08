{ inputs, ... }:
{
  additions = final: _prev: import ../custom-packages { pkgs = final; };

  modifications = final: prev: {
    neovim = prev.neovim // {
      neovim = inputs.nixvim.packages.x86_64-linux.default;
    };
  };

      

  #neovim = final: prev: {
  #  neovim = inputs.nixvim.packages.x86_64-linux.default;
  #};
  
  #pkgs = import inputs.nixpkgs {
  # system = "x86_64-linux";
  #  overlays = [
  #    (final: prev: {
  #      neovim = inputs.nixvim.packages.x86_64-linux.default;
  #    })
  #  ];
  #};
  ###  pkgs = pkgsFor.x86_64-linux {
  ###    overlays = [
  ###      (final: prev: {
  ###        neovim = inputs.nixvim.packages.x86_64-linux.default;
  ###      })
  ###    ];
  ###  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
