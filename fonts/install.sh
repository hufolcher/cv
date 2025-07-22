#!/bin/bash

# Absolute path to your fonts directory
SOURCE_DIR="$(pwd)"

# User font directory
DEST_DIR="$HOME/.fonts"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Symlink each .ttf file
for font in "$SOURCE_DIR"/*.ttf; do
    filename=$(basename "$font")
    target="$DEST_DIR/$filename"

    # Remove existing file/symlink
    rm -f "$target"

    # Create symbolic link
    ln -s "$font" "$target"
    echo "Linked: $font → $target"
done

# Refresh font cache
fc-cache -f -v

echo "Fonts symlinked and cache updated locally."
