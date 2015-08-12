# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [[ -f ./.osx && `uname` == "Darwin" ]]; then
	/usr/bin/osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "k" using command down'
else
	if [ "$SHLVL" = 1 ]; then
	    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
	fi
fi
