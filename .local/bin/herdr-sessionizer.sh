#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Projects ~/ ~/Personal -mindepth 1 -maxdepth 1 -type d 2>/dev/null | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

# Find existing workspace by label
workspace_id=$(herdr workspace list 2>/dev/null \
    | jq -r --arg name "$selected_name" '.workspaces[] | select(.label == $name) | .workspace_id' 2>/dev/null \
    | head -1)

if [[ -n $workspace_id ]]; then
    herdr workspace focus "$workspace_id"
else
    herdr workspace create --cwd "$selected" --label "$selected_name" --focus
fi
