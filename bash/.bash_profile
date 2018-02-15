
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Git configuration
# Branch name in prompt
source ~/.git.prompt.sh
PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

#Aliases

alias psrv="source .env && iex -S mix phx.server"

# Node paths
export PATH="$HOME/.node_modules_global/bin:$PATH"
export NODE_PATH="$HOME/.node_modules_global/lib/node_modules"

# Python path
export PATH="/usr/local/Cellar/python/2.7.13/bin/python:$PATH"
