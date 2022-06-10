#!/usr/bin/env bash

# user priviliges
umask 022

# path
[[ -z $TMUX ]] && export PATH="$HOME/go/bin:$HOME/.local/bin:$HOME/repos/bash-scripts:$PATH"

# gnupg agent
export GPG_TTY=$(tty)
gpg-connect-agent --quiet updatestartuptty /bye >/dev/null
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# vi keybindings
set -o vi

# history
export HISTTIMEFORMAT="%Y-%m-%d %T "
export HISTCONTROL="ignoreboth"	# commands with preceding space will not be appended to history

# pagers
export PAGER="bat"
export BAT_PAGER="less"
export DELTA_PAGER="less"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LESSCHARSET="utf-8"

# openers
export EDITOR="vim"
export VISUAL="vim"
export OPENER="xdg-open"

# configs
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep"
export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"
export LYNX_LSS="$HOME/.config/lynx/lynx.lss"

# lang
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# rust cargo
[[ -d $HOME/.cargo ]] && source $HOME/.cargo/env

# dircolors
[[ ! -f $HOME/.dircolors ]] && $(dircolors --print-database >> $HOME/.dircolors)
eval `dircolors -b $HOME/.dircolors`

# aliases
alias cl="clear"
alias vi="vim"
alias ll="exa -Flmga@ --color-scale --icons -s name --group-directories-first --git"
alias rm="rm -i"
alias ls="ls --color=always"
alias grep="grep --color=always"
alias man='MANWIDTH=$((COLUMNS > 80 ? 80 : COLUMNS)) man'
alias lf="$HOME/repos/bash-scripts/lf-ueberzug"
alias mutt="neomutt"
alias open="xdg-open"

# prompt
function __make_prompt() {
	PS1=""

	color_off='\e[0m'       # color reset
	black='\e[0;30m'        # regular black
	red='\e[0;31m'          # regular red
	green='\e[0;32m'        # regular green
	yellow='\e[0;33m'       # regular yellow
	blue='\e[0;34m'         # regular blue
	purple='\e[0;35m'       # regular purple
	cyan='\e[0;36m'         # regular cyan
	white='\e[0;37m'        # regular white
	bblack='\e[1;30m'       # bold black
	bred='\e[1;31m'         # bold red
	bgreen='\e[1;32m'       # bold green
	byellow='\e[1;33m'      # bold yellow
	bblue='\e[1;34m'        # bold blue
	bpurple='\e[1;35m'      # bold purple
	bcyan='\e[1;36m'        # bold cyan
	bwhite='\e[1;37m'       # bold white
	ublack='\e[4;30m'       # underline black
	ured='\e[4;31m'         # underline red
	ugreen='\e[4;32m'       # underline green
	uyellow='\e[4;33m'      # underline yellow
	ublue='\e[4;34m'        # underline blue
	upurple='\e[4;35m'      # underline purple
	ucyan='\e[4;36m'        # underline cyan
	uwhite='\e[4;37m'       # underline white

	# python venv
	if [ -n "${VIRTUAL_ENV}" ]; then
		local venv=`basename $VIRTUAL_ENV`
		PS1+="\[${green}\]( ${venv}) \[${color_off}\]"
	fi

	# user
	if [ ${USER} == root ]; then
		PS1+="\[${ublue}\]"
	else
		PS1+="\[${bblue}\]"
	fi
	PS1+="\u\[${color_off}\]\[${bwhite}\]@\[${color_off}\]"

	# ssh
	if [ -n "${SSH_CONNECTION}" ]; then
		PS1+="\[${ured}\]\h\[${color_off}\]"
	else
		PS1+="\[${bred}\]\h\[${color_off}\]"
	fi

	# working directory
	PS1+="\[${bwhite}\]:\[${byellow}\]\w\[${color_off}\] "

	# bg jobs
	no_jobs=`jobs -p | wc -w`
	if [ ${no_jobs} != 0 ]; then
		PS1+="\[${bgreen}\][j${no_jobs}]\[${color_off}\] "
	fi

	# git branch
	if [ -x "`which git 2>&1`" ]; then
		local rev="$(git name-rev --name-only HEAD 2>/dev/null)"
		if [ -n "${rev}" ]; then
			local branch="$(git branch | cut -d ' ' -f 2)"
			local git_status="$(git status --porcelain -b 2>/dev/null)"
			local letters="$( echo "${git_status}" | grep --regexp=' \w ' | sed -e 's/^\s\?\(\w\)\s.*$/\1/' )"
			local untracked="$( echo "${git_status}" | grep -F '?? ' | sed -e 's/^\?\(\?\)\s.*$/\1/' )"
			local modified="$( echo -e "${letters}\n${untracked}" | sort | uniq | tr -d '[:space:]' )"
			if [ -n "${modified}" ]; then
				PS1+="\[${bred}\] ${branch} "
			else
				PS1+="\[${bgreen}\] ${branch} "
			fi
			PS1+="\[${color_off}\] "
		fi
	fi

	# exit code
	local exit="$?"
	if [ ${exit} != 0 ]; then
		PS1+="\[${bred}\][!${exit}]\[${color_off}\] "
	fi
	# prompt
	PS1+="\[${green}\]\[${color_off}\] "
	# continuation prompt
	PS2="\[${bpurple}\]\[${color_off}\] "
}

PROMPT_COMMAND=__make_prompt

# exa colors
export EXA_COLORS="uu=37;40;:gu=37;40;"

# lf icons
export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.vimrc=:\
*.viminfo=:\
*.gitignore=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# remap fzf ctrl-t to ctrl-p
bind -m vi-command -x '"\C-p": fzf-file-widget'
bind -m vi-insert -x '"\C-p": fzf-file-widget'
bind -m vi-command -x '"\C-x\C-p": rfzf'
bind -m vi-insert -x '"\C-x\C-p": rfzf'
bind -r '\C-t' # remove ctrl-t
bind -r '\ec'  # remove esc-c binding

export FZF_DEFAULT_COMMAND="fd -L -tf -tl --hidden --exclude .git --exclude .cache --exclude .npm --exclude .node_modules --exclude *.pyc --exclude .nvm --exclude .dropbox --exclude .dropbox-dist"
export FZF_DEFAULT_OPTS="--info=inline --layout=reverse"
export FZF_CTRL_T_COMMAND="fd -L -tf -tl --hidden --exclude .git --exclude .cache --exclude .npm --exclude .node_modules --exclude *.pyc --exclude .nvm --exclude .dropbox --exclude .dropbox-dist"
export FZF_CTRL_T_OPTS="--ansi --info=inline --prompt 'file> ' --preview 'bat {}'"
export FZF_ALT_C_COMMAND="fd -td --hidden -L --exclude .git --exclude .cache --exclude .npm --exclude .node_modules --exclude *.pyc --exclude .nvm --exclude .dropbox --exclude .dropbox-dist"
export FZF_ALT_C_OPTS="--info=inline --prompt 'cd> '"
export FZF_CTRL_R_OPTS="--layout=default --prompt 'history> '"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# neofetch
neofetch
