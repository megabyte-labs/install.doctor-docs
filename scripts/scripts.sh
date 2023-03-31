#!/usr/bin/env bash

if ! command -v shdoc > /dev/null; then
    echo "Installing shdoc"
    brew install shdoc
fi

if [ ! -d "install.doctor/.git" ]; then
    echo "Ensuring Install Doctor is cloned"
    rm -rf "install.doctor/.git"
    git clone https://github.com/megabyte-labs/install.doctor.git
fi

find "./install.doctor/home" -type f -name "*.sh.tmpl" | while read SCRIPT; do
    echo "Creating documentation for $SCRIPT"
    echo "---" > "docs/scripts/$(basename "$SCRIPT")"
    echo "title: $(shdoc < "$SCRIPT" | head -n 1 | sed 's/$# //')" >> "docs/scripts/$(basename "$SCRIPT")"
    echo "description: $(shdoc < "$SCRIPT" | head -n 3)" >> "docs/scripts/$(basename "$SCRIPT")"
    echo "sidebar_label: Scripts" >> "docs/scripts/$(basename "$SCRIPT")"
    echo "slug: /scripts/$(basename "$SCRIPT")" >> "docs/scripts/$(basename "$SCRIPT")"
    echo "scriptLocation: $(echo "$SCRIPT" | sed 's/.*\/install.doctor\///')" >> "docs/scripts/$(basename "$SCRIPT")"
    echo "---" > "docs/scripts/$(basename "$SCRIPT")"
    shdoc < "$SCRIPT" >> "docs/scripts/$(basename "$SCRIPT")"
done
