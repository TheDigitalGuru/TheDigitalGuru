#My_Bashrc_Aliases_File

#Alias to quickly Update & Upgrade system
alias uu='sudo apt update && sudo apt upgrade -y'

#Navigation_Aliases

alias ll='ls -la' 
alias la='ls -A'
alias l='ls -CF'
#Alias to Change Directory to home directory
alias hm='cd ~' 
alias rt='cd /' 
#Alias to Change Directory to parent directory
alias bk='cd ..' 
#Aliases to Change Directory to my projects folder
alias pjs='cd ~/Documents/Projects' 

#History
#Capture history to file for documenting and understanding my code
alias rec='history > ~/Documents/LoggedProgress/Record-$(date +"%Y-%m-%d-%H:%M:%S")'
#Clean history so I don't capture too much info
alias cln='history -c'
