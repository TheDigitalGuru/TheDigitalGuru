# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# See bash(1) for more options

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#####  Function to Show a Colormap on demand  ############
function colormap() {
        for i in {0..255}; do print -Pn  "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#####  Function to make directory then cd into it  ############
#
function take { 
	mkdir -p $1
	cd $1
}

#####  Docker Functions ############
#
function dclear {
	docker ps -a -q | xargs docker kill -f 
	docker ps -a -q | xargs docker rm -f
	docker images | awk "{print $3}" | xargs docker rmi -f
	docker volume prune -f
}

#####  Quick Notes  ############
function note {
	echo "date: $(date)" >> $HOME/drafts.txt
	echo "$@" >> $HOME/drafts.txt
	echo "" >> $HOME/drafts.txt
}

#####  Function to Source Alias definitions into seperate File  ############
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#####  Functions for Starship  ############
# find out which distribution we are running on
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
# set an icon based on the distro
case $_distro in
        *kali*)                 ICON="";;
        *raspbian*)             ICON="🍓";;
        *ubuntu*)               ICON="🐧";;
        *)                      ICON="";;
esac
export STARSHIP_DISTRO="$ICON "
export STARSHIP_CONFIG=/home/digital/.config/starship.toml
#Invoke starship toml file
eval "$(starship init bash)"

#####  Functions for NVM  ############
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
