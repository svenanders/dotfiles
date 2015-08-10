####################
# Alias
####################

# Default
alias ls="ls -G -F"
alias la="ls -al"
alias ll="ls -l"
alias l="ls -lhctFGp"

alias pu="pushd ."
alias po="popd"

alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias h="cd ~"

alias o="open"
alias oo="open ."
alias h="history"

alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Dropbox/Dev"

alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias pw="pwgen -s1vv 12 | pbcopy && echo Nytt passord er kopiert til utklippstavlen"
alias pwl="pwgen -s1vv 64 | pbcopy && echo Nytt passord er kopiert til utklippstavlen"

# Safer rm
alias rm="rm -i"
alias s='open -a "Sublime Text" '
alias md='open -a "Mou"'
alias gonode='brew unlink iojs && brew link node'
alias goio='brew unlink node && brew link iojs --force'

# Colored up cat!
# -- Remember to install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Git
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'

# Code-convenience

alias mci='mvn clean install'
alias mcit='mvn clean install -Dmaven.test.skip'
alias mt='mvn test'

alias g="git"

####################
# Exports
####################

for d in local $(ls /opt/ | grep -v local); do
	FULLPATH=/opt/$d
	if [ -x $FULLPATH ]; then
		if [ -x $FULLPATH/bin ]; then
			export PATH="$PATH:$FULLPATH/bin"
		fi
		if [ -x $FULLPATH/sbin ]; then
			export PATH="$PATH:$FULLPATH/sbin"
		fi
		if [ -x $FULLPATH/share/aclocal ]; then
			export ACLOCAL_FLAGS="-I $FULLPATH/share/aclocal $ACLOCAL_FLAGS"
		fi
		if [ -x $FULLPATH/man ]; then
			export MANPATH="$MANPATH:$FULLPATH/man"
		fi
		if [ -x $FULLPATH/share/man ]; then
			export MANPATH="$MANPATH:$FULLPATH/share/man"
		fi
		if [ -x $FULLPATH/lib/pkgconfig ]; then
			export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$FULLPATH/lib/pkgconfig/"
		fi
	fi
done

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/bin:$PATH

# Node

export NODE_PATH="/usr/local/lib/node"

# Heroku

export PATH="/usr/local/heroku/bin:$PATH"

# History

shopt -s cmdhist
export HISTCONTROL=erasedups
export HISTFILESIZE=10000
export HISTIGNORE="&:ls:cd:[bf]g:exit:..:...:l:ll:la:pu:po:unrar:exit"
export HISTSIZE=10000

# Language

export NLS_LANG=NORWEGIAN_NORWAY.UTF8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Grep

GREP_OPTIONS='--color=auto'
GREP_COLORS='ms=1;31'
export GREP_OPTIONS GREP_COLORS

# Man

MANWIDTH=80
export MANWIDTH

# Mail

unset MAILCHECK

####################
# Functions
####################

function _useJava() {
	export JAVA_HOME=$(/usr/libexec/java_home -v ${1} -d64)
}

_useJava 1.8

function server() {
	python -m SimpleHTTPServer $1
}
