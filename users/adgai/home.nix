{ config, pkgs,lib, ... }:
let 
  tmuxPlugin = with pkgs; [tmuxPlugins.cpu
      tmuxPlugins.prefix-highlight
      tmuxPlugins.online-status
      tmuxPlugins.fpp
      tmuxPlugins.resurrect
      tmuxPlugins.net-speed
      tmuxPlugins.continuum
      tmuxPlugins.sensible
      tmuxPlugins.open
      tmuxPlugins.battery
      tmuxPlugins.tmux-fzf
      tmuxPlugins.fzf-tmux-url
      tmuxPlugins.yank];
      in
{
# Home Manager needs a bit of information about you and the
# paths it should manage.
  home.username = "adgai";
  home.homeDirectory = "/home/adgai";
  imports = [./alacritty.nix ./starship.nix ./zsh.nix];

# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
#
# You can update Home Manager without changing this value. See
# the Home Manager release notes for a list of state version
# changes in each release.
  home.stateVersion = "22.05";

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [bottom tree ripgrep pavucontrol];
  services.dunst.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.git = {
    enable = true;
    userEmail = "gaitondeaditya@gmail.com";
    userName = "Aditya Gaitonde";
  };
  programs.kitty = {
  enable = true;
  };
  programs.bat = {
    enable = true;
  };
  programs.tmux = {
    enable = true; 
    plugins = tmuxPlugin;
      extraConfig = ''
      unbind C-b
set -g prefix C-t
bind C-t send-prefix
bind -n C-g send-prefix

setw -g aggressive-resize on
set -g status-right-length 180
set -s set-clipboard on

bind -n C-Left  previous-window
bind -n C-Right next-window
bind  e switch-client -l

# tmux statusline config
set -g status-interval 1
# terminal color config
set-option -g default-terminal "screen-256color"
set-option -gw xterm-keys on

 # copy 
setw -g mode-keys vi
bind -T copy-mode    C-c send -X copy-pipe-no-clear "xsel -i --clipboard"
bind -T copy-mode-vi C-c send -X copy-pipe-no-clear "xsel -i --clipboard"
set -g message-style "fg=#7aa2f7,bg=#3b4261"
set -g mode-style "fg=#7aa2f7,bg=#3b4261"
set -g message-command-style "fg=#7aa2f7,bg=#3b4261"
set -g pane-border-style "fg=#3b4261"
set -g pane-active-border-style "fg=#7aa2f7"
set-option -g focus-events on 

set -g status "on"
set -g status-style "fg=#7aa2f7,bg=#1f2335"

set -g status-left-length "100"

set -g @fzf-url-bind 'u'

set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

set -g status-left "#[fg=#15161E,bg=#7aa2f7,bold] #S #[fg=#7aa2f7,bg=#1f2335,nobold,nounderscore,noitalics]|"
set -g status-right "#[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#1f2335] #{prefix_highlight} #[fg=#3b4261,bg=#1f2335,nobold,nounderscore,noitalics]\
|#[fg=#7aa2f7,bg=#3b4261]Continuum status: #{continuum_status}|Battery#{battery_percentage}|Network status:#{online_status}|Speed:#{net_speed} %Y-%m-%d | %I:%M %p #[fg=#7aa2f7,bg=#3b4261,nobold,nounderscore,noitalics]\
|#[fg=#15161E,bg=#7aa2f7,bold] #h "

# Continuum status: #{continuum_status}'
set -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#1f2335"
set -g window-status-separator ""
set -g window-status-style "NONE,fg=#a9b1d6,bg=#1f2335"
set -g window-status-format "#[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]"
set -g window-status-current-format "#[fg=#1f2335,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261,bold] #I  #W #F #[fg=#3b4261,bg=#1f2335,nobold,nounderscore,noitalics]"

  
# Mouse mode
setw -g mouse on
set-option -sg escape-time 10

# Set easier window split keys
bind-key v split-window -h  -c "#{pane_current_path}"
bind-key h split-window -v -c "#{pane_current_path}"
bind-key + split-window -h -p 20 -c "#{pane_current_path}"
bind-key = split-window -v -p 20 -c "#{pane_current_path}"
bind-key c-h select-pane -R 
bind-key c-l select-pane -L 
bind-key c-k select-pane -U 
bind-key c-j select-pane -D 

# move better bw panes
bind -n M-` select-window -t 0
bind -n M-0 select-window -t 10
bind -n M-1 select-window -t 1
bind -n M-2 select-window -t 2
bind -n M-3 select-window -t 3
bind -n M-4 select-window -t 4
bind -n M-5 select-window -t 5
bind -n M-6 select-window -t 6
bind -n M-7 select-window -t 7
bind -n M-8 select-window -t 8
bind -n M-9 select-window -t 9

bind S choose-tree -swZ
# simpler window to show only sessions
bind s choose-session -swZ
# terminal session management
bind -n C-s display-popup -E "tmux-sessionizer"
bind C-g popup -E -c "#{pane_current_path}" #"zsh"

set-window-option -g automatic-rename
set -g default-terminal 'screen-256color'
set -g history-limit 10000
set-option -sa terminal-overrides 'screen-256color:RGB'
set -g @net_speed_format "D:%4s U:%4s"
set -g @continuum-restore 'on'

set -g @fpp-key 'k'

      ${lib.concatStrings (map (x: "run-shell ${x.rtp}\n") tmuxPlugin)}
      '';

      

  };
}
