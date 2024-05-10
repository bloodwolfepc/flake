{ inputs, ... }:
{
  home.packages = [ inputs.neovim.packages.x86_64-linux.default ];
  home.sessionVariables = {
    EDITOR = "nvim"; #TODO setup for shell 
#TODO setup where, if on local machine use local (testing version), if not then pull from git
  };
}


#{
#  programs.neovim = {
#    enable = true;
#  };
#}
