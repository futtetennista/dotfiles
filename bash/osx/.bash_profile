# http://superuser.com/a/244990

# curl -o ~/.git-completion.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source ~/.git-completion.bash
# curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh

[ -r ~/.bashrc ] && source ~/.bashrc
[ -r ~/.profile ] && source ~/.profile
[ -r ~/.bash_functions ] && source ~/.bash_functions

# http://stackoverflow.com/questions/3466626/add-private-key-permanently-with-ssh-add-on-ubuntu/11832171#11832171
# without -K it asks for my password each time a new terminal window is created
# ssh-add -K ~/.ssh/id_rsa &>/dev/null

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

# https://docs.docker.com/compose/completion/#install-command-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

export PATH="$HOME/.cabal/bin/:$PATH"
export PATH="$HOME/.ghcup/bin/:$PATH"

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export PATH="$PATH:$ANDROID_TOOLS_HOME:$ANDROID_PLATFORM_TOOLS_HOME:$HASKELL_STACK"

# I want to have r-x11 first
export PATH=/usr/local/opt/r-x11/bin:$PATH

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH="$HOME/Library/Python/2.7/bin/:$PATH"

export PATH="/usr/local/opt/python@3.9/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.9/lib"
export PKG_CONFIG_PATH="/usr/local/opt/python@3.9/lib/pkgconfig"

export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"

export PATH="/usr/local/opt/krb5/bin:$PATH"
export PATH="/usr/local/opt/krb5/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/krb5/lib"
export CPPFLAGS="-I/usr/local/opt/krb5/include"

export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/curl-openssl/lib"
export CPPFLAGS="-I/usr/local/opt/curl-openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/curl-openssl/lib/pkgconfig"

# Completions
eval "$(stack --bash-completion-script stack)"

# if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# kubectl bash completion
# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

