#!/bin/sh

file="$1"; shift
case "$(basename "$file" | tr '[:upper:]' '[:lower:]')" in
	*.tar*) tar tf "$file" ;;
	*.zip) unzip -l "$file" ;;
	*.rar) unrar l "$file" ;;
	*.7z) 7z l "$file" ;;
	*.jpg|*.jpeg|*.png|*.bmp|*.webp|*.svg|*.gif)
		chafa -c full --color-space rgb -p on --stretch "$file"
		;;
	*) bat "$file" ;;
esac
return 127
