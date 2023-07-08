export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git colored-man-pages)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias vi="nvim"
alias :q="exit"
alias edit="sudoedit"
alias lg="lazygit"

alias fail="return 1"
alias succeed="return 0"

function is_arch {
  if type "pacman" > /dev/null ; then
    succeed
  fi

  fail
}

function is_installed {
  if is_arch ; then
    if pacman -Qs $1 > /dev/null ; then
      succeed
    fi

    fail
  fi

  fail
}

function not_installed {
  if is_installed $1 ; then
    fail
  fi

  succeed
}

function install {
  if is_installed $1 ; then
    succeed
  fi

  if is_arch ; then
    if sudo pacman -S $1 ; then
      succeed
    fi

    fail
  fi

  echo "cant install \`$1\` no install command found, please set one up in install()"
  fail
}

