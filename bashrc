#
# custom .bashrc
#
#
echo "-------- load .bashrc "

if [[ $- != *i* ]] ; then
# Shell is non-interactive.  Be done now!
  return
fi

# IPAD default profile
source "/etc/profile"

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if [[ -f ~/.dir_colors ]]; then
  eval `dircolors -b ~/.dir_colors`
#else
#  eval `dircolors -b /etc/DIR_COLORS`
fi

# Change the window title of X terminals
case $TERM in
  xterm*|rxvt*|Eterm)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
    ;;
    screen)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
    ;;
esac

# LANGUAGE
export LANGUAGE=en_US.UTF-8

# PROMPT
__git_ps1 ()
{
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf " (%s)" "${b##refs/heads/}";
  fi
}

# SHELL COLORS
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
END="\[\e[0m\]"
PS1="$RED.:$GREEN\u@\h$RED:. $BLUE\w$RED"' $(__git_ps1 " (%s)") '"\$$END "
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# LOAD ALIASES
if [ -f "$HOME/.bashrc_aliases" ]
then
  source "$HOME/.bashrc_aliases"
fi

# PATH
export PATH=/usr/local/bin:$HOME/vfxtools/bin:${PATH}

# VIRUTALENVWRAPPER
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# LESS
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# HOUDINI SOURCE FILE
source ${HOME}/vfxtools/houdini/houdini_setup_bash
source ${HOME}/vfxtools/bin/houdinienv
