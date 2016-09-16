# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

UNAME=`uname`

# import bash git prompt
 if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
   GIT_PROMPT_THEME=skao
   source ~/.bash-git-prompt/gitprompt.sh
 fi

## Aliases

# ls coloring
# Darwin is mac os
if [[ `uname` == 'Darwin' ]]; then
  export CLICOLOR=1
  export LSCOLORS=ExFxCxDxBxegedabagacad
  alias ls='ls -a'
else
  alias ls='ls -a --color=auto'
fi


printJson() {
  echo $1 | python -mjson.tool
}

# fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias v='nvim'
alias vf='nvim $(fzf)'
alias tmux='TERM=xterm-256color tmux'
alias h='history'
alias grep='grep --color'
alias g='git'
alias gr='git-review'
alias gd='git review dcommit'
alias mu='mint update'
alias mt='mint test'
alias gjs='grep --color -irn --include="*.js" --exclude="*public/li*"'
alias pjson=printJson
alias less='less -R'
alias ag='ag --ignore-dir ./test-integration/fixtures/ --ignore-dir ios-linkedin-v2/ios/LinkedIn/Source/PerfTools/MockData --ignore-dir ios-linkedin-v2/ios/LinkedIn/Assets/'
alias ad='arc diff'
alias al='arc land'
alias o='open *.xcworkspace'


# bash
set -o vi

# path
GIT_HOME=/usr/local/Cellar/git/1.8.3.2
SVN_HOME=/opt/subversion
export ANT_HOME=/opt/apache-ant-1.7.1

#android
export ANDROID_HOME=/Users/skao/sdk
export ANDROID_ROOT=/Users/skao/sdk
export ANDROID_SDK=/Users/skao/sdk
if [[ "$UNAME" == 'Linux' ]] ; then
  export ANDROID_HOME=/home/skao/sdk
  export ANDROID_ROOT=/home/skao/sdk
  export ANDROID_SDK=/home/skao/sdk
  #export JAVA_HOME=/export/apps/jdk/JDK-1_6_0_27/
else
  export ANDROID_HOME=/Users/skao/sdk
  export ANDROID_ROOT=/Users/skao/sdk
  export ANDROID_SDK=/Users/skao/sdk
  export JAVA_HOME="`/usr/libexec/java_home -v '1.8*'`"
  export MAVEN=/usr/local/Cellar/maven/3.3.9/bin
  #export SCALA_HOME="/usr/local/Cellar/scala/2.11.4"
fi

export PATH=$JAVA_HOME/bin:$MAVEN:$PATH
export PATH=$PATH:$ANT_HOME/platform-tools
export PATH=$PATH:$ANT_HOME/tools
export PATH=$PATH:/opt/scala-2.11.1/bin

export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec/
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# pods
export PATH=/Users/skao/.gem/ruby/2.0.0/bin:$PATH

PATH=/usr/local/bin:$JAVA_HOME/bin:$ANT_HOME/bin:/usr/local/opt/ruby/bin:$GIT_HOME/bin:$SVN_HOME/bin:~/bin:$PATH:~/sdk/platform-tools:~/sdk/tools:~/.npmprefix/bin:/usr/local/sbin:~/.rbenv/shims

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

# [[ -s "$HOME/.bash_functions" ]] && source "$HOME/.bash_functions"

[[ -s "$HOME/.bash_local" ]] && source "$HOME/.bash_local"


#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

