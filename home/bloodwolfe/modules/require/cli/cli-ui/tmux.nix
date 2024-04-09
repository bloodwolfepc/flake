{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-f";
    disableConfirmationPrompt = true;
    mouse = false;
    tmuxinator.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      tmux-thumbs
      tmux-fzf
      fzf-tmux-url
      fuzzback
      extrakto
      {
        plugin = yank;
        extraConfig = ''
          set-window-option -g mode-keys vi

          bind-key -T copy-mode-vi v send-keys -X begin-selection
          bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
          bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        '';
      }
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-startegy-nvim 'session'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60'
        '';
      }

      ];
    extraConfig = ''
      unbind %
      bind-key - split-window -h -c "#{pane_current_path}"
      bind-key v split-window -v -c "#{pane_current_path}"

      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5
      bind -r m resize-pane -Z

      set -g status off
    '';
  };
}
