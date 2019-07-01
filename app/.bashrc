#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# env
export LANG=ja_JP.UTF-8

# alias
alias ll='ls -la'
alias less='less -XR'
alias vi='vim'

# pyenv
export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
