{ pkgs, ... }: {
  programs.taskwarrior = { 
    enable = true; 
    package = pkgs.taskwarrior3;
    #config = { };
    #extraconfig = { };
  };
  #sessionVariables = {
  #  TASKRC = "${config.home.homeDirectory}/.config/taskwarrior/.taskrc";
  #};
  home.packages = with pkgs; [
    taskwarrior-tui
  ];
}
