{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-a";
    tmuxinator.enable = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      #tmuxPlugins.resurrect
      ];
    extraConfig = ''
      unbind %
      bind-key | split-window -h
      bind-key - split-window -v

      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5
      bind -r m resize-pane -Z
    '';
  };
}
