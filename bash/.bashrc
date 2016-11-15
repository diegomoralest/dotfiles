# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias vi='gvim -v'
alias vim='gvim -v'
alias gvi='gvim'
alias sudoi='sudo -i'

export EDITOR='gvim -v'
alias tmux="tmux -2"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
