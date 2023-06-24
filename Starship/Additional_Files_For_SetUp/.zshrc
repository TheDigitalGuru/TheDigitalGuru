eval "$(starship init zsh)"

#Colormap
function colormap() {
        for i in {0..255}; do print -Pn  "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# Alias Commands
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

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
