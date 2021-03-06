
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

# Node paths
export PATH="$HOME/.node_modules_global/bin:$PATH"
export NODE_PATH="$HOME/.node_modules_global/lib/node_modules"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="Users/federicorodriguez/Library/Python/3.9/bin:${PATH}"
export PATH

# Set Rust environment
source "$HOME/.cargo/env"

# Set GO environment
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# Use kiex's default version for elixir
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

#path for custom executables
export PATH="$HOME/bin:$PATH"

# path for postgresl version 10
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

# Source nvm upon login
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
