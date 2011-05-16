# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
KEYTIMEOUT=10
setopt append_history autocd inc_append_history complete_in_word hist_ignore_all_dups
bindkey -v
#bindkey -v '\e[3~' delete-char
#bindkey -v '\e[H' vi-beginning-of-line
#bindkey -v '\e[7~' vi-beginning-of-line
#bindkey -v '\e[F' vi-end-of-line
#bindkey -v '\e[8~' vi-end-of-line
bindkey  'OH' vi-beginning-of-line    # for gnome terminal
bindkey -M vicmd '[1~' vi-beginning-of-line   # for gnome terminal
bindkey  'OF' vi-end-of-line          # for gnome terminal
bindkey -M vicmd '[4~' vi-end-of-line         # for gnome terminal
bindkey -M vicmd '^?' backward-delete-char
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
#bindkey -M vicmd 'K' history-incremental-search-backward
bindkey -M viins '[A' up-line-or-history
bindkey -M viins '[B' down-line-or-history
bindkey -v '\e[Z' reverse-menu-complete
bindkey -M viins '^E' push-input # not working
bindkey -v '^Z' undo

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jonas/.zshrc'
MSG=/var/log/messages.log
#------------------------
# Autoloading Modules
# -----------------------

autoload -Uz compinit promptinit zmv
compinit
promptinit

zmodload zsh/complist
### If you want zsh's completion to pick up new commands in $path automatically
### comment out the next line and un-comment the following 5 lines
#zstyle ':completion:::::' completer _complete _approximate _prefix
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1  # Because we didn't really complete anything
}
zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' command 'ps -axco pid,user,command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#-----------------------------
# Dircolors
#-----------------------------
#LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
#export LS_COLORS

# PS1 and PS2
#export PS1="$(print '%{\e[1;34m%}%n%{\e[0m%}'):$(print '%{\e[0;34m%}%~%{\e[0m%}')$ "
#export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;190m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export TERM='xterm-256color'
export ECLIM_ECLIPSE_HOME=/usr/share/eclipse
export PATH=$PATH:~/bin:/opt/java/bin

#-----------------------------#
#Aliases											#
#-----------------------------#
alias ls="ls --color -F --group-directories-first"
alias ll="ls --color -lh --group-directories-first"
alias la="ls --color -alh --group-directories-first"
alias du='du -h'
alias df='df -h'
alias rcp='rsync --progress -h'
alias publicip="curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias mkvplayer="mplayer -lavdopts lowres=1:fast:skiploopfilter=all -vf scale=720:-2"
alias vim="gvim -v"
alias sim="sudo vim"
# Set up auto extension stuff
#BROWSER=firefox
#EDITOR=vim
#alias -s html=$BROWSER
#alias -s org=$BROWSER
#alias -s php=$BROWSER
#alias -s com=$BROWSER
#alias -s net=$BROWSER
alias -s png=feh
alias -s jpg=feh
alias -s gif=feg
alias -s sxw=soffice
alias -s doc=soffice
alias -s gz=tar -xzvf
alias -s bz2=tar -xjvf
#alias -s java=$EDITOR
#alias -s txt=$EDITOR
#alias -s PKGBUILD=$EDITOR

# End of lines added by compinstall

# let's load colors into our environment, then set them
    autoload -Uz colors

    if [[ "$terminfo[colors]" -gt 8 ]]; then
        colors
    fi

    # The variables are wrapped in %{%}. This should be the case for every
    # variable that does not contain space.
    for COLOR in RED GREEN YELLOW BLUE WHITE BLACK; do
        eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
        eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
    done
#----------------------------
# Options
#----------------------------
setopt hist_ignore_all_dups no_beep no_nomatch prompt_subst
setopt extendedglob
#----------------------------
# Functions
#----------------------------

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
## Display current working directory in XTerm Titlebar
chpwd() {
    [[ -t 1 ]] || return
    case $TERM in
      sun-cmd) print -Pn "\e]l%~\e\\"
        ;;
      *xterm*|rxvt|rxvt-256color|(dt|k|E)term) print -Pn "\e]2;%~\a"
        ;;
    esac
  }
chpwd

# If I am using vi keys, I want to know what mode I'm currently using.
# zle-keymap-select is executed every time KEYMAP changes.
# From http://zshwiki.org/home/examples/zlewidgets
function zle-line-init zle-keymap-select {
  if [[ ${KEYMAP} = vicmd ]] ; then
    VICOLOR1="$(print '%{\e[38;5;56m%}')"
    VICOLOR2="$(print '%{\e[38;5;99m%}')"
  else
    VICOLOR1="%{$fg_bold[green]%}"
    VICOLOR2="%{$fg_no_bold[green]%}"
  fi

    #VIMODE="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/}"
#    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#function zle-keymap-select {
#    VIMODE="${${KEYMAP/vicmd/ Command}/(main|viins)/}"
#    zle reset-prompt
#}
#
#zle -N zle-keymap-select


#-----------------------------
# Prompt
#-----------------------------
#RPROMPT="$(print '${VIMODE}%{\e[38;5;32m%}%~%{\e[0m%}')"
#PROMPT="$(print '%{\e[38;5;32m%}%n%{\e[0m%}@%{\e[38;5;46m%}%m%{\e[0m%}%# ')"
#}
# The following 9 lines of code comes directly from Phil!'s ZSH prompt
#    # http://aperiodic.net/phil/prompt/
#    local TERMWIDTH
#    (( TERMWIDTH = ${COLUMNS} - 1 ))
#
#    local PROMPTSIZE=${#${(%):--- %D{%R.%S %a %b %d %Y}\! }}
#    local PWDSIZE=${#${(%):-%~}}
#
#    if [[ "$PROMPTSIZE + $PWDSIZE" -gt $TERMWIDTH ]]; then
# (( PR_PWDLEN = $TERMWIDTH - $PROMPTSIZE ))
#    fi



setprompt () {
    USRPROMPT="$(print '%{\e[38;5;32m%}%n%{\e[0m%}@%{\e[38;5;46m%}%m%{\e[0m%} ')"
# Finally, let's set the prompt
#    PROMPT='${PR_BOLD_RED}<${PR_RED}<${PR_BOLD_BLACK}<${PR_BOLD_WHITE} \
#%D{%R.%S %a %b %d %Y}${PR_RED}!${PR_BOLD_WHITE}%${PR_PWDLEN}<...<%<< \
#
#${PR_BOLD_RED}<${PR_RED}<${PR_BOLD_BLACK}<\
#${PR_BOLD_WHITE} ${USRPROMPT}${PR_RED}!${PR_BOLD_WHITE}%h${PR_BOLD_RED}\
#%(?.. E:%?)${PR_BOLD_BLUE}${PR_SCREEN}${PR_JOBS}\
#${PR_BOLD_WHITE}${VIMODE}\
#
#${PR_BOLD_BLACK}>${PR_GREEN}>${PR_BOLD_GREEN}>\
#%{${reset_color}%} '
    PROMPT='${PR_BOLD_BLACK}>${VICOLOR2}>${VICOLOR1}>\
%{${reset_color}%} '
    RPROMPT="$(print '%{\e[38;5;32m%}${GITTED}%~%{\e[0m%}')"
    # Of course we need a matching continuation prompt
    PROMPT2='\
${PR_BOLD_BLACK}>${PR_GREEN}>${PR_BOLD_GREEN}>\
${PR_BOLD_WHITE} %_ ${PR_BOLD_BLACK}>${PR_GREEN}>\
${PR_BOLD_GREEN}>%{${reset_color}%} '
}

setprompt


precmd () { 

# Set Colors of Lower Arrow in Prompt
    VICOLOR1="%{$fg_bold[green]%}"
    VICOLOR2="%{$fg_no_bold[green]%}"
# set a simple variable to show when in screen
    if [[ -n "${WINDOW}" ]]; then
        PR_SCREEN=" S:${WINDOW}"
    else
        PR_SCREEN=""
    fi
# check if jobs are executing
    if [[ $(jobs | wc -l ) -gt 0 ]]; then
        PR_JOBS=" J:%j"
    else
      PR_JOBS=""
    fi
# Set git marker if directory is managed by git
  if [[ -d ".git" ]] ; then
    GITTED=" "`parse_git_branch`
  else
    GITTED=""
  fi

   print -rP '${PR_BOLD_RED}<${PR_RED}<${PR_BOLD_BLACK}<\
${PR_BOLD_WHITE} ${USRPROMPT}${PR_RED}! ${PR_BOLD_BLACK}%*${PR_BOLD_RED}\
%(?.. E:%?)${PR_BOLD_BLUE}${PR_SCREEN}${PR_JOBS}${PR_BOLD_WHITE}'}

