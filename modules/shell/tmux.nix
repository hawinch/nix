{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    tmux
  ];

  # Symlink legacy ~/.tmux.conf to $XDG_CONFIG_HOME/tmux/tmux.conf for macOS weirdness
  home.file.".tmux.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/tmux/tmux.conf";
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";

    clock24 = true;
    historyLimit = 50000;
    mouse = true;

    extraConfig = ''
      # Reload config using r
      bind r source-file ${config.xdg.configHome}/tmux/tmux.conf

      # Split horizontally using -
      bind - split-window -v -c "#{pane_current_path}"
      unbind %

      # Split vertically using |
      bind | split-window -h -c "#{pane_current_path}"
      unbind '"'

      # Display message duration 4s
      set -g display-time 4000

      # Status bar general
      set -g status-interval 1
      set -g status-style default

      # Status bar left - windows
      set -g status-left '''
      setw -g window-status-current-style 'fg=black bg=white'
      setw -g window-status-current-format ' #I:#P #W '
      setw -g window-status-style 'fg=white'
      setw -g window-status-format ' #I #W '

      # Status bar right - date/time
      set -g status-right ' %a %d %b %H:%M:%S '
      set -g status-right-style 'fg=black bg=white'

      # Window status notif
      setw -g window-status-bell-style 'fg=yellow bg=red bold'
    '';
  };
}
