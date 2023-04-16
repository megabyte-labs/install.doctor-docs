#!/usr/bin/env bash

cd install.doctor/home/dot_config/task
TASKS="$(task --list)"

task --list | while read LINE; do
    TASK="$(echo "$LINE" | sed 's/\* \(.*\):[^ ]*\(.*\)/\1/')"
    TASK_DESC="$(echo "$LINE" | sed 's/\* \(.*\):[^ ]*\(.*\)/\2/')"
    if ! echo "$TASK" | grep 'Available tasks for this project'; then
        FILE="../../../../docs/cli/commands/$(echo "$TASK" | tr ":" -).md"
        mkdir -p "$(dirname "$FILE")"
        SUMMARY="$(task --summary "$TASK")"
        LINE_NUMBER="$(awk '/  '"$TASK"':/{ print NR; exit }' Taskfile.yml)"
        echo "---" > "$FILE"
        echo "title: "$(echo "$SUMMARY" | sed -n '3p' | sed 's/\# //')"" >> "$FILE"
        echo "description: $TASK_DESC" >>"$FILE"
        echo "sidebar_label: $TASK" >> "$FILE"
        echo "slug: /cli/commands/$(echo "$TASK" | tr ":" -)" >> "$FILE"
        echo "githubLocation: https://github.com/megabyte-labs/install.doctor/blob/master/home/dot_config/task/Taskfile.yml#L$LINE_NUMBER" >> "$FILE"
        echo "repoLocation: home/dot_config/task/Taskfile.yml" >> "$FILE"
        echo "---" >> "$FILE"
        TMP="$(mktemp)"
        echo "$SUMMARY" > "$TMP"
        TRIMMED_TMP="$(mktemp)"
        cat "$TMP" | tail -n +5 > "$TRIMMED_TMP"
        SED_EXE="$(which sed)"
        if command -v gsed > /dev/null; then
            SED_EXE="$(which gsed)"
        fi
        $SED_EXE '/commands:/Q' < "$TRIMMED_TMP" >> "$FILE"
        echo "Done with $FILE"
    fi
done
