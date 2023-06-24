#My_Bashrc_Aliases_File

alias uu='sudo apt update && sudo apt upgrade -y' #Alias to quickly Update & Upgrade system

#Navigation_Aliases
alias ll='ls -la' 
alias la='ls -A'
alias l='ls -CF'
alias g="goto" 
alias hm='cd ~' #Alias to Change Directory to home directory
alias rt='cd /' 
alias bk='cd ..' #Alias to Change Directory to parent directory
alias pjs='cd ~/Documents/Projects'  #Aliases to Change Directory to my projects folder

#History
#Capture history to file for documenting and understanding my code
alias rec='history > ~/Documents/LoggedProgress/Record-$(date +"%Y-%m-%d-%H:%M:%S")'
alias cln='history -c' #Clean history so I don't capture too much info
