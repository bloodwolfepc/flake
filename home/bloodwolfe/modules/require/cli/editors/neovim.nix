{ inputs, ... }:
{
  home.packages = [ inputs.nixvim.packages.x86_64-linux.default ];
  home.sessionVariables = {
    EDITOR = "nvim"; #TODO setup for shell #TODO cure traces
  };
}


#{
#  programs.neovim = {
#    enable = true;
#  };
#}
