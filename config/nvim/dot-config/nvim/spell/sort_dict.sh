#!/bin/bash
DICT_FILE="$HOME/.config/nvim/spell/en.utf-8.add"
cp "$DICT_FILE" "$DICT_FILE.bak"
sort -u "$DICT_FILE.bak" > "$DICT_FILE"
echo "Sorted $DICT_FILE"

