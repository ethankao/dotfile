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
alias grm='git rebase master'
alias pjson=printJson
alias less='less -R'
alias ad='arc diff'
alias al='arc land'


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

export HOMEBREW_NO_SANDBOX=1
export PATH=/usr/local/opt/python/libexec/bin:/Users/skao/.rbenv/shims:/usr/local/bin:/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home/bin:/opt/apache-ant-1.7.1/bin:/usr/local/opt/ruby/bin:/usr/local/Cellar/git/1.8.3.2/bin:/opt/subversion/bin:/Users/skao/bin:/Users/skao/.gem/ruby/2.0.0/bin:/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home/bin:/usr/local/Cellar/maven/3.3.9/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/munki:/Users/skao/.rvm/bin:/Users/skao/.fzf/bin:/opt/apache-ant-1.7.1/platform-tools:/opt/apache-ant-1.7.1/tools:/opt/scala-2.11.1/bin:/Users/skao/.go/bin:/usr/local/opt/go/libexec//bin:/Users/skao/sdk/platform-tools:/Users/skao/sdk/tools:/Users/skao/.npmprefix/bin:/usr/local/sbin:/Users/skao/.rbenv/shims

nvm use default
