#!/usr/bin/env bash

set -e

TEXTFIEND="$1"
TESTDIR="$2"

evalhex() {
    rm -f "$2"
    touch "$2"
    cat "$1" | sed -E 's/[ ]*#.*$//' | while read -r e; do
        echo -ne "$e" >> "$2"
    done
}

CASETEMP=$(mktemp)
for i in $(cd "$TESTDIR" && ls *.tcl) ; do
    CASE=${i%.tcl}
    echo "Test: $CASE"

    evalhex "$TESTDIR/$CASE.hex" "$CASETEMP"
    "$TEXTFIEND" -b -f json "$TESTDIR/$CASE.tcl" "$CASETEMP" > "$CASETEMP.json"
    diff -u "$TESTDIR/$CASE.json" "$CASETEMP.json"
done

rm -f "$CASETEMP"
