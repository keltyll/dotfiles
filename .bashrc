source /etc/profile

# colorscript -r

pfetch
# imwheel -b 45

# function _update_ps1() {
#    PS1=$(powerline-shell $?)
# }
#
# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

#History size is infinite
HISTSIZE= HISTFILESIZE= # Infinite history

#nnn
# export NNN_BMS='h:~;p:~/Pictures;d:~/Downloads;c:~/.config;I:/run/media/new_volume/Izabela'
export NNN_COLORS='1267'
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'

#list of aliases - First try
alias p="sudo pacman"
alias iw="imwheel -b 45"
alias ts="sudo timeshift-gtk"
alias rldm="sudo systemctl restart lightdm"
# alias ls='ls -hN --color=auto --group-directories-first'
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias dodo="systemctl suspend"
alias logout="xfce4-session-logout --logout"
alias byebye="sudo /sbin/shutdown -r now"
alias xedi3="xed ~/.config/i3/config"
alias cleancache="sudo paccache -rk1"
alias webcam="mplayer tv:// -tv driver=v4l2:device=/dev/video0"
alias rm="rm -iv"
alias cp="cp -iv"
alias ll='lsd -Fl'
alias clock='tty-clock -C 1 -s'
alias nnn='nnn -Rd'
alias n='nnn -Rd'
alias unimatrix='unimatrix -l c -s 95'
alias q='exit'
alias lsmount="mount | column -t"
alias dpause="dunstctl set-paused true"
alias drun="dunstctl set-paused false"
alias mount1tb="doas mkdir /run/media/western_digital && doas mount /dev/sda1 /run/media/western_digital/"
alias tearing='nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"'

# exec fish

export EDITOR='vim'
export VISUAL='vim'

eval "$(starship init bash)"
