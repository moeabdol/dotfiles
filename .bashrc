export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/bin/git:$PATH

# set term
export TERM=screen-256color

# set prompt color
PS1='\[\e[0;32m\]\h\[\e[m\]:\[\e[1;34m\]\W\[\e[m\] \[\e[0;32m\]\u\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# set console output colors
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# set grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='31'

# set editor
export EDITOR="vim"

# set vim less
alias vless='/opt/local/share/vim/vim74/macros/less.sh'

# set history size
export HISTSIZE=10000
export HISTFILESIZE=10000

# set colored nosetests
# must install nosetests and rednose
export NOSE_REDNOSE=1
alias nosetests='nosetests -v --with-coverage --cover-erase'
