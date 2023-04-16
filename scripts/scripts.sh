#!/usr/bin/env bash

if ! command -v shdoc > /dev/null; then
    echo "Installing shdoc"
    brew install shdoc
fi

if [ ! -d "install.doctor/.git" ]; then
    echo "Ensuring Install Doctor is cloned"
    rm -rf "install.doctor"
    git clone https://github.com/megabyte-labs/install.doctor.git
else
    cd install.doctor
    git pull origin master
    cd ..
fi

mkdir -p docs/scripts/after
mkdir -p docs/scripts/before
mkdir -p docs/scripts/profile
mkdir -p docs/scripts/utility
find "./install.doctor/home" -type f -name "*.sh.tmpl" | while read SCRIPT; do
    TMP="$(mktemp)"
    shdoc < "$SCRIPT" >> "$TMP"
    echo "Creating documentation for $SCRIPT"
    if echo "$SCRIPT" | grep 'after_'; then
        MD_FILE="docs/scripts/after/$(basename "$SCRIPT").md"
        TAG=after
    elif echo "$SCRIPT" | grep 'before_'; then
        MD_FILE="docs/scripts/before/$(basename "$SCRIPT").md"
        TAG=before
    else
        MD_FILE="docs/scripts/profile/$(basename "$SCRIPT").md"
        TAG=profile
    fi
    NUMBER_ID_PREFIX=""
    if echo "$SCRIPT" | grep '[0-9][0-9]'; then
        NUMBER_ID_PREFIX="$(echo "$SCRIPT" | sed 's/.*\([0-9][0-9]\).*/\1/') "
    fi
    echo "---" > "$MD_FILE"
    echo "title: $(shdoc < "$SCRIPT" | head -n 1 | sed 's/\# //')" >> "$MD_FILE"
    echo "description: $(shdoc < "$SCRIPT" | sed -n '3p')" >> "$MD_FILE"
    echo "sidebar_label: $NUMBER_ID_PREFIX$(shdoc < "$SCRIPT" | head -n 1 | sed 's/\# //')" >> "$MD_FILE"
    echo "slug: /scripts/$TAG/$(basename "$SCRIPT")" >> "$MD_FILE"
    echo "githubLocation: https://github.com/megabyte-labs/install.doctor/blob/master/$(echo "$SCRIPT" | sed 's/.*\/install.doctor\///')" >> "$MD_FILE"
    echo "scriptLocation: https://github.com/megabyte-labs/install.doctor/raw/master/$(echo "$SCRIPT" | sed 's/.*\/install.doctor\///')" >> "$MD_FILE"
    echo "repoLocation: $(echo "$SCRIPT" | sed 's/.*\/install.doctor\///')" >> "$MD_FILE"
    echo "---" >> "$MD_FILE"
    cat "$TMP" >> "$MD_FILE"
    echo "## Source Code" >> "$MD_FILE"
    echo "" >> "$MD_FILE"
    echo '```' >> "$MD_FILE"
    cat "$SCRIPT" >> "$MD_FILE"
    echo '```' >> "$MD_FILE"
done

find "./install.doctor/scripts" -mindepth 1 -maxdepth 1 -type f -name "*.sh" | while read SCRIPT; do
    TMP="$(mktemp)"
    shdoc < "$SCRIPT" >> "$TMP"
    echo "Creating documentation for $SCRIPT"
    MD_FILE="docs/scripts/utility/$(basename "$SCRIPT").md"
    TAG=utility
    echo "---" > "$MD_FILE"
    echo "title: $(shdoc < "$SCRIPT" | head -n 1 | sed 's/\# //')" >> "$MD_FILE"
    echo "description: $(shdoc < "$SCRIPT" | sed -n '3p')" >> "$MD_FILE"
    echo "sidebar_label: $(shdoc < "$SCRIPT" | head -n 1 | sed 's/\# //')" >> "$MD_FILE"
    echo "slug: /scripts/$TAG/$(basename "$SCRIPT")" >> "$MD_FILE"
    echo "githubLocation: https://github.com/megabyte-labs/install.doctor/blob/master/$(echo "$SCRIPT" | sed 's/.*\/install.doctor\///')" >> "$MD_FILE"
    echo "scriptLocation: https://github.com/megabyte-labs/install.doctor/raw/master/$(echo "$SCRIPT" | sed 's/.*\/install.doctor\///')" >> "$MD_FILE"
    echo "repoLocation: $(echo "$SCRIPT" | sed 's/.*\/install.doctor\///')" >> "$MD_FILE"
    echo "---" >> "$MD_FILE"
    cat "$TMP" >> "$MD_FILE"
    echo "## Source Code" >> "$MD_FILE"
    echo "" >> "$MD_FILE"
    echo '```' >> "$MD_FILE"
    cat "$SCRIPT" >> "$MD_FILE"
    echo '```' >> "$MD_FILE"
done
