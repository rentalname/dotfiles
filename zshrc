# ${fg[...]} や $reset_color をロード
autoload -U colors; colors

function rprompt-git-current-branch {
local name st color

if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
  return
fi
name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
if [[ -z $name ]]; then
  return
fi
st=`git status 2> /dev/null`
if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
  color=${fg[green]}
elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
  color=${fg[yellow]}
elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
  color=${fg_bold[red]}
else
  color=${fg[red]}
fi

# %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
# これをしないと右プロンプトの位置がずれる
echo "%{$color%}$name%{$reset_color%} "
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

#setting prompt
case ${UID} in
  0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    RPROMPT='[`rprompt-git-current-branch`%~]'
    ;;
  *)
    PROMPT="%{[31m%}✘╹◡╹✘[%T]%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    RPROMPT='[`rprompt-git-current-branch`%~]'
    ;;
esac

#zsh-completions setting
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit

#autojump setting
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

#rbenv setting
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

if [[ ! -o interactive ]]; then
  return
fi

compctl -K _rbenv rbenv

_rbenv() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(rbenv commands)"
  else
    completions="$(rbenv completions ${words[2,-2]})"
  fi

  reply=("${(ps:\n:)completions}")
}

#direnv setting
eval "$(direnv hook $0)"

# add git commands

## git commit shorthand
gcm(){ git commit -m "$*"}

## git add at file position
gsta(){
  if [ $# -eq 1 ]; then
    git add `git status -s -b | grep -v "^#" | awk '{print$1="";print}' | grep -v "^$" | awk "NR==$1"`
  else
    exit 1
  fi
}

## git diff at file position
gstd(){
  if [ $# -eq 1 ]; then
    git diff -- `git status -s -b | grep -v "^#" | awk '{print$1="";print}' | grep -v "^$" | awk "NR==$1"`
  else
    exit 1
  fi
}

## open modified file at position
gstv(){
  if [ $# -eq 1 ]; then
    vim `git status -s -b | grep -v "^#" | awk '{print$1="";print}' | grep -v "^$" | awk "NR==$1"`
  else
    exit 1
  fi
}
gsts(){
  if [ $# -eq 1 ]; then
    subl `git status -s -b | grep -v "^#" | awk '{print$1="";print}' | grep -v "^$" | awk "NR==$1"`
  else
    exit 1
  fi
}

gchs(){
  if [ $# -eq 2 ]; then
    git show `git cherry -v $1 | awk '{print $2}' | awk "NR==$2"`
  else
    exit 1
  fi
}
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# setting tub title function
title(){
  echo -e "\033];$*\007"
}
