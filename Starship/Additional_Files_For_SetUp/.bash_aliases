#My_Bashrc_Aliases_File

#Update & Upgrade
alias uu='sudo apt update && sudo apt upgrade -y' #Alias to quickly Update & Upgrade system
alias c="clear"
alias d="docker"
#quickly source dotfiles
alias sb="source ~/.bashrc"

#Navigation_Aliases
alias ..='cd ..' #Alias to Change Directory to parent directory
alias ...='cd ../../' #Alias to Change Directory to parent's parent directory
alias g="goto" 
alias hm='cd ~' #Alias to Change Directory to home directory
alias pjs='cd ~/Documents/Projects/'  #Aliases to Change Directory to my projects folder

#show aliases
alias a='echo "------------Your aliases------------";alias'

#Opens a GUI text editor in the background. Can obviously be replaced with your favorite editor
alias text='gedit &'
#Same as above with super user privileges
alias sutext='gksudo gedit &'

#Capture history to file for documenting and understanding my code
alias hrec='history > ~/Documents/LoggedHistory/LoggedProgress_bash/Record-$(date +"%Y-%m-%d-%H:%M:%S")'
alias hclr='history -c' #Clean history so I don't capture too much info
alias hs='history | grep $1' #History search (use: hs sometext)

# Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="exa --icons --group-directories-first"
    alias ll="exa --icons --group-directories-first -la"
    alias la="exa --icons --group-directories-first -A"
    alias l="exa --icons --group-directories-first -CF"
    alias sl="exa --icons --group-directories-first"
    alias dir="dir --color=auto"
    alias vdir="vdir --color=auto"
    alias grep="grep --color=auto"
    alias fgrep="fgrep --color=auto"
    alias egrep="egrep --color=auto"
fi
#sudo install exa

#trimming strings
alias trim="awk '{\$1=\$1;print}'"

#Better trash management
#Better Protected from Mayhem #sudo apt install trash-cli
alias throw='trash-empty'
alias revive='trash-restore'
alias trash='trash-put'
alias rm='trash-put'
#Add extra protection against mistakes
#alias rm='rm -I'

