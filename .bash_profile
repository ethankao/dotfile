# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#### Setup Prompt
MyRed="\[\033[1;31m\]"
MyGreen="\[\033[0;36m\]"
ResetColor="\[\033[0m\]"

# set git_prompt_start/end for bash git prompt
GIT_PROMPT_START="${MyRed}\t${ResetColor}"
GIT_PROMPT_END="${MyGreen}\u@\h:\w${ResetColor} $ "

PS1="${GIT_PROMPT_START} ${MyGreen}\u@\h:\w${ResetColor} $ "

# import bash git prompt
__GIT_PROMPT_DIR=~/.bash-git-prompt
. ${__GIT_PROMPT_DIR}/gitprompt.sh

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

alias v='vim'
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


# path
GIT_HOME=/usr/local/Cellar/git/1.8.3.2
SVN_HOME=/opt/subversion
export ANT_HOME=/opt/apache-ant-1.7.1

#android
export ANDROID_HOME=/Users/skao/sdk
export ANDROID_ROOT=/Users/skao/sdk
export ANDROID_SDK=/Users/skao/sdk
export JAVA_HOME="`/usr/libexec/java_home -v '1.8*'`"

export PATH=$PATH:$ANT_HOME/platform-tools
export PATH=$PATH:$ANT_HOME/tools
export PATH=$PATH:/opt/scala-2.11.1/bin

PATH=/usr/local/bin:$ANT_HOME/bin:/usr/local/opt/ruby/bin:$GIT_HOME/bin:$SVN_HOME/bin:~/bin:$PATH:~/sdk/platform-tools:~/sdk/tools:~/.npmprefix/bin

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

[[ -s "$HOME/.bash_local" ]] && source "$HOME/.bash_local"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
