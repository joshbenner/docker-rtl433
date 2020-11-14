#!/bin/sh

# Accept all params on docker run CLI too.
if [ ! $# -eq 0 ]; then
    exec rtl_433 $@
fi

if [ -z "$CLI_OPTIONS" ]; then
    CLI_OPTIONS=""

    if [ ! -z "$UNITS" ]; then
        CLI_OPTIONS="$CLI_OPTIONS -C $UNITS"
    fi

    if [ ! -z "$DEVICEINDEX" ]; then
        CLI_OPTIONS="$CLI_OPTIONS -d $DEVICEINDEX"
    fi

    if [ ! -z "$OUTPUT" ]; then
        CLI_OPTIONS="$CLI_OPTIONS -F $OUTPUT"
    fi
fi

echo "CLI: rtl_433 $CLI_OPTIONS"
exec rtl_433 $CLI_OPTIONS
