#!/usr/bin/env bash

CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/herdr-sessionizer"
mkdir -p "$CACHE_DIR"

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Projects ~/ ~/Personal -mindepth 1 -maxdepth 1 -type d 2>/dev/null | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
if [[ "$selected" == "$HOME" || "$selected" == "$HOME/" ]]; then
    selected_name="~"
fi

cache_file="$CACHE_DIR/$selected_name"

# Fast path: try cached workspace ID directly
if [[ -f "$cache_file" ]]; then
    cached_id=$(cat "$cache_file")
    if herdr workspace focus "$cached_id" 2>/dev/null; then
        exit 0
    fi
    # Cached ID is stale (workspace was closed), fall through
    rm -f "$cache_file"
fi

# Slow path: list workspaces and find by label
workspace_id=$(herdr workspace list 2>/dev/null \
    | jq -r --arg name "$selected_name" '.result.workspaces[] | select(.label == $name) | .workspace_id' 2>/dev/null \
    | head -1)

if [[ -n "$workspace_id" ]]; then
    echo "$workspace_id" > "$cache_file"
    herdr workspace focus "$workspace_id"
else
    result=$(herdr workspace create --cwd "$selected" --label "$selected_name" --focus 2>/dev/null)
    workspace_id=$(echo "$result" | jq -r '.result.workspace.workspace_id' 2>/dev/null)
    if [[ -n "$workspace_id" ]]; then
        echo "$workspace_id" > "$cache_file"
    fi
fi
