{ inputs, pkgs, ... }: {
  home.packages = [ 
    inputs.nixvim.packages.x86_64-linux.default 
    #pkgs.texliveFull
    #pkgs.texlivePackages.latexmk


  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
