# ~/.bash_profile
# The personal initialization file, executed for login shells.

# Read /etc/inputrc if the variable is not defined.
[ -n "$INPUTRC" ] || export INPUTRC=/etc/inputrc

# Source the aliases and functions.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Set terminal size after COM connection (if possible)
Query '\e[18t' HW
H=${HW#*;}; W=${H#*;}; H=${H%%;*}; W=${W%%t*}
case "$H:$W" in
	[1-9]*:[0-9]*)
		test -n "$H" -a -n "$W" && stty rows $H columns $W
	;;
esac

# Try to guess if background color is black (xterm-only)
Query '\e]11;?\e\\' RGB
# Try go guess if colors are supported at all (urxvt)
if [ -z "$RGB" ]; then
	Query '\e]4;7;?\e\\' RGB
	test -z "$RGB" || export TERM=rxvt-unicode-256color
else
	export TERM=xterm-256color
fi
B=${RGB##*/}; R=${RGB##*rgb:}; G=${RGB#*/}; R=${R%%/*}; G=${G%%/*}; B=${B%%[^[a-e0-9]*}
case "$R$G$B" in
	????????????)
		alias ip="ip --color=auto"
		BG=$((0x$R+0x$G+0x$B))
		if [ $BG -le 65536 ]; then		# Dark background
			eval `dircolors ~/.dircolors`
		else					# Light background
			eval `dircolors /etc/DIR_COLORS`
		fi
	;;
esac	

# Informative PS1
PS1="[\[`tput dim`\]\u\[`tput sgr0`\]@\[`tput smul`\]\h\[`tput rmul`\] \W]\[`tput bold`\]\\$\[`tput sgr0`\] "

export EDITOR=/usr/bin/vim
mesg n
