function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo 'Hg' && return
    echo '○'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  PROMPT='%{$fg[green]%}%~%{$reset_color%} %{$fg[red]%}‹$(~/.rvm/bin/rvm-prompt i v)› %{$reset_color%} $(git_prompt_info)%{$reset_color%}%B$%b '
else
  if which rbenv &> /dev/null; then
    PROMPT='%{$fg[green]%}%~%{$reset_color%} %{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")› %{$reset_color%} $(git_prompt_info)%{$reset_color%}%B$%b '
  fi
fi

PROMPT='%{%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) $(prompt_char) using %{$fg_bold[blue]%}$(~/.rvm/bin/rvm-prompt)%{$reset_color%} $(virtualenv_info)
'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
