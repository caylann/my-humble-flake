#!/usr/bin/env bash

BOOKS_DIR="$HOME/Books"

if [ -z "$1" ]; then
    find "$BOOKS_DIR" -type f \( -iname "*.pdf" -o -iname "*.epub" -o -iname "*.djvu" -o -iname "*.fb2" \) | sed -E "s|^$BOOKS_DIR/||; s|\.[^./]+$||" | sort
else
    SELECTED="$1"
    FULL_PATH=$(find "$BOOKS_DIR" -type f \( -iname "*.pdf" -o -iname "*.epub" -o -iname "*.djvu" -o -iname "*.fb2" \) | awk -v dir="$BOOKS_DIR/" -v sel="$SELECTED" '{ clean = $0; sub("^" dir, "", clean); sub(/\.[^.\/]+$/, "", clean); if (clean == sel) { print $0; exit } }')

    if [ -f "$FULL_PATH" ]; then
        coproc ( okular "$FULL_PATH" >/dev/null 2>&1 )
    fi
fi
