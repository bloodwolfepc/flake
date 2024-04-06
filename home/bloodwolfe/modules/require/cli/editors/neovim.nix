{ inputs, ... }:
{
  home.packages = [ inputs.nixvim.packages.x86_64-linux.default ];
  home.sessionVariables = {
    EDITOR = "nvim"; #TODO setup for shell
  };
}


#{
#  programs.neovim = {
#    enable = true;
#  };
#}
