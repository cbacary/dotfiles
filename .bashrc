# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# EDITOR command for sudoedit
export EDITOR="nvim"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

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

# comment out for an uncolored prompt
force_color_prompt=yes

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# >>> conda initialize >>>
if [ -f "/home/cbac/anaconda3/shell/condastart.sh" ]; then 
    source "/home/cbac/anaconda3/shell/condastart.sh"
else
    __conda_setup="$('/home/cbac/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)" # pipe stderr output to /dev/null
    if [ $? -eq 0 ]; then # If the __conda_setup command succesfully terminated do: 
        eval "$__conda_setup"
        echo "$__conda_setup" > "/home/cbac/anaconda3/shell/condastart.sh"
    else
        if [ -f "/home/cbac/anaconda3/etc/profile.d/conda.sh" ]; then
            echo "sourcing conda.sh"
        else
            echo "exporting conda to path"
        fi
    fi
    unset __conda_setup
fi

update_ps1() {
    if [ -n "$CONDA_DEFAULT_ENV" ]; then
        conda_env="($CONDA_DEFAULT_ENV)"
    else
        conda_env=""
    fi

    if [ "$color_prompt" = yes ]; then
        PS1="$conda_env ${debian_chroot:+($debian_chroot)}"
        PS1="$PS1\[\033[0;36m\]\u@\h\[\033[00m\]:\[\033[0;36m\]\w"
        PS1="$PS1\n \[\033[0;34m\]\$ \[\033[00m\]"
    else
        PS1="$conda_env${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
    fi

}

PROMPT_DIRTRIM=4
PROMPT_COMMAND="update_ps1; $PROMPT_COMMAND"

LS_COLORS=$LS_COLORS:'ow=01;34'

# Loading nvm
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.nvm/nvm.sh
nvm use --lts

export PATH="$HOME/llvm-project/build/bin:$PATH"        # NVIM C++ Autocomplete
export PATH="$HOME/ccls/Release:$PATH"                  # NVIM C++ Autocomplete
export PATH="/home/cbac/.cargo/bin:$PATH"               # Rust
export PATH="/usr/bin/tmux:$PATH"                       # TMUX
export PATH="/home/cbac/.spicetify:$PATH"               # Spotify Fancy

export LD_LIBRARY_PATH="$HOME/llvm-project/build/lib:$LD_LIBRARY_PATH"
