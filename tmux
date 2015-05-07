set-option -g status-bg blue

# a mouse
set -g mode-mouse on
setw -g mouse-select-window on
setw -g mouse-select-pane on

set-option -g status-interval 60
set-option -g status-left "#[fg=blue,dark]#(gcalcli agenda | head -2 | tail -1)#[default]"

# Set prefix to Ctrl+A
set -g prefix C-a

# allow Ctrl+A a, to jump to the beginning of a line
bind a send-prefix

# Set history limit to 100000 long
set-option -g history-limit 100000

# Ensure VIM shortcuts and colours still work
set -g default-terminal "xterm-256color"
setw -g xterm-keys on

# More meaningful split-key bindings
# - for horizontal
# | for vertical
bind-key | split-window -h 
bind-key - split-window

# Enable / for searching
setw -g mode-keys vi # I especially like being able to search with /,? when in copy-mode

# bind {hjkl} as pane movement keys
unbind-key j
bind-key j select-pane -D 
unbind-key k
bind-key k select-pane -U
unbind-key h
bind-key h select-pane -L
unbind-key l
bind-key l select-pane -R

# Fix chromedriver in tmuxx
set-option -g default-command "reattach-to-user-namespace -l zsh"

source /usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf
