#!/bin/sh

file="$1"; shift
case "$(basename "$file" | tr '[:upper:]' '[:lower:]')" in
	*.tar*) tar tf "$file" ;;
	*.zip) unzip -l "$file" ;;
	*.rar) unrar "$file" ;;
	*.7z) 7z "$file" ;;
	*.jpg|*.jpeg|*.png|*.bmp|*.webp|*.svg|*.gif) ctpv "$file" ;;
	*) bat "$file" ;;
esac
return 127
