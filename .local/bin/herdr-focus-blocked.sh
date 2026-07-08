#!/usr/bin/env bash

# Get all blocked agents as {id, focused} pairs
agents_json=$(herdr agent list 2>/dev/null \
    | jq -c '.result.agents[] | select(.agent_status == "blocked") | {id: .terminal_id, focused: .focused}' 2>/dev/null)

if [[ -z "$agents_json" ]]; then
    exit 0
fi

ids=()
focused_idx=-1
idx=0
while IFS= read -r agent; do
    ids+=("$(echo "$agent" | jq -r '.id')")
    if [[ "$(echo "$agent" | jq -r '.focused')" == "true" ]]; then
        focused_idx=$idx
    fi
    ((idx++))
done <<< "$agents_json"

count=${#ids[@]}
[[ $count -eq 0 ]] && exit 0

next_idx=$(( (focused_idx + 1) % count ))
herdr agent focus "${ids[$next_idx]}"
