# ~/.bashrc
# The individual per-interactive-shell startup file.

# Source global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Define user specific aliases and functions.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias d='ls'
alias s='cd ..'
alias p='cd -'
alias vi="vim"
unalias rm 2> /dev/null
unalias cp 2> /dev/null
unalias mv 2> /dev/null
# GNU Screen support
test -n "$STY" && PS1="[$WINDOW]$PS1"

# XTerm-like property query
Query() { # ESC-sequence variable
	STTY=`stty -g`
	stty raw -echo
	echo -en "$1"
	eval read -t 1 -d ${1:0-1} $2
	stty $STTY
}
