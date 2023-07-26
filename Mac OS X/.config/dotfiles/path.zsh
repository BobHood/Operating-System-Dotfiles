#!/bin/sh
########################################################################
####                 .zsh Shell Path variables                      ####
########################################################################
# Actually, however, zsh takes all that trouble away from you. The incantation `typeset -U path', where the -U
# stands for unique, tells the shell that it should not add anything to $path if it's there already. To be 
# precise, it keeps only the left-most occurrence, so if you added something at the end it will disappear and
#  if you added something at the beginning, the old one will disappear. Thus the following works nicely in .zshenv:

#  typeset -U path
#  path=(~/bin ~/progs/bin $path)
# and you can put down that `for' stuff as a lesson in shell programming. You can list all the variables which
# have uniqueness turned on by typing `typeset +U', with `+' instead of `-', because in the latter case the
# shell would show the values of the parameters as well, which isn't what you need here. The -U flag will also
# work with colon-separated arrays, like $PATH.

typeset -U PATH path
export PATH="$PATH:$HOME:$HOME/.dotfiles:$HOME/.config:$HOME/Applications:$HOME/Applicaitons\ (Parallels)"
export PATH="$PATH:$HOME/bin:/usr/local/bin"
export PATH="$PATH:$HOME/sbin:/usr/local/sbin"
export PATH="$PATH:$HOME/.config.oh-my-zsh/custom/plugins/zsh-lux"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/opt/homebrew/bin:opt/homebrew/etc:opt/homebrew/opt"
export PATH="$PATH:/opt/homebrew/opt/openssl@3/bin"
export PATH="$PATH:/opt/homebrew/opt/ruby/bin"
export PATH="$PATH:/opt/homebrew/opt/libtool/libexec/gnubin"
