#!/usr/bin/env bash
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
. "$HOME/.cargo/env"
