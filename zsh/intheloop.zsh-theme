# A multiline prompt with username, hostname, full path, return status, git branch, git dirty status, git remote status


local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

local host_color="065"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="red"
fi

PROMPT='
%{$FG[244]%}[%{$reset_color%}%{$FX[bold]$FG[${host_color}]%}%n@work%$FX[no_bold]{$reset_color%}%{$FG[244]%}]%{$reset_color%} %{$fg_bold[blue]%}%10c%{$reset_color%} $(git_prompt_info) $(git_remote_status)
%{$FG[244]%}🏒 ❯%{$reset_color%} '


RPROMPT='${return_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[115]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}🫧 %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[magenta]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[magenta]%}↕%{$reset_color%}"

# Blinking light-purple block cursor; re-hooked last so it beats Ghostty's bar.
_intheloop_cursor_shape() { print -n '\e[1 q\e]12;#cba6f7\a'; }
_intheloop_cursor_setup() {
  autoload -Uz add-zle-hook-widget
  local ev
  for ev in line-init keymap-select; do
    add-zle-hook-widget -d $ev _intheloop_cursor_shape 2>/dev/null
    add-zle-hook-widget $ev _intheloop_cursor_shape
  done
  add-zsh-hook -d precmd _intheloop_cursor_setup
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _intheloop_cursor_shape
add-zsh-hook precmd _intheloop_cursor_setup
