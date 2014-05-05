#set zsh setting
setopt auto_pushd
setopt auto_cd
setopt list_packed
setopt nolistbeep
setopt transient_rprompt
fpath=(/usr/local/share/zsh-completions $fpath)

#set enviroment
export EDITOR=subl
export SHELL=/usr/local/opt/zsh/bin/zsh
export GITREP2=ssh://git@hyakuren.org/home/git
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export NODE_PATH=$NODE_PATH:$HOME/.nodebrew/current/lib/node_modules
export RBENV_CONFIGURE_VAR='MAKE_OPTS="-j4" CONFIGURE_OPTS="--with-readline_dir=$(brew --prefix readline) --with-iconv-dir=/usr/lib --with-openssl-dir=$(brew --prefix openssl)"'
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/mysql/support-files:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/heroku/bin:$PATH     ### Added by the Heroku Toolbelt
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

#set alias
alias ..='cd ../'
alias ls='ls -G'
alias la='ls -a -G'
alias ll='ls -l -G'

alias rewind='exec $SHELL -l'
alias zrc='vi ~/.zshrc'
alias zenv='vi ~/.zshenv'

alias be='bundle exec'
alias bip='bundle install --path vendor/bundle'
alias bigrate='bundle exec rake db:migrate'
alias taret='bundle exec rake db:migrate:reset RAILS_ENV=test'
alias fs='bundle exec foreman start'
alias ss='bundle exec spring rspec'
alias tesc='RAILS_ENV=test bundle exec rails c'

alias gst='git status && git stash list'
alias gch='git cherry -v'

alias dree='sudo mysql.server restart'
alias tags='ctags -R -f .tags'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
