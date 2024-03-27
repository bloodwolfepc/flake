{ inputs, ... }:
{
  additions = final: _prev: import ../custom-packages { pkgs = final; };
  modifications = final: prev: {
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
