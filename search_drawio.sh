#!/bin/bash

# Prompt user for directory and search text
read -p "Enter the directory containing .drawio files(a directory from typing pwd in terminal): " TARGET_DIR
read -p "Enter the text to search for(without \"\"): " SEARCH_TEXT

# Check if directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Search inside all .drawio (XML-based) files
echo "Searching for '$SEARCH_TEXT' in .drawio files under '$TARGET_DIR'..."

# grep -i -r --include="*.drawio" "$SEARCH_TEXT" "$TARGET_DIR"
grep -i -r --include="*.drawio" "$SEARCH_TEXT" "$TARGET_DIR" | cut -d':' -f1 | sort -u

# Check if any matches were found
if [ $? -eq 0 ]; then
    echo "Search complete. Matches found."
else
    echo "No matches found."
fi


# grep -i "search_term" *.drawio