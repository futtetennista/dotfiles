# http://superuser.com/a/244989

alias gw="./gradlew --daemon"
alias gwo="./gradlew --daemon --offline"
alias mci="mvn clean install"
alias cd..="cd .."
alias e=emacs
alias g=git
alias d=docker
alias b=brew
alias bc="brew cask"

# SHELL COMMANDS
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"

# GIT
# alias gpl="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"

# LESS
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -g -i -J --underline-special --SILENT'
# alias more='less'

# https://github.com/bbatsov/prelude#ugly-colors-in-the-terminal-emacs-version
export TERM=xterm-256color

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

