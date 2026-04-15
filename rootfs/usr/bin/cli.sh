#!/bin/bash

mc banner || true

# Run CLI
COMMAND=""
while true; do
    COMMAND="$(rlwrap -S $'\e[32mmc > \e[0m' -H /tmp/.cli_history -o cat)"

    # Abort to host?
    if [ "$COMMAND" == "help" ]; then
        echo "Note: Use \"login\" to enter operating system shell"
    elif [ "$COMMAND" == "login" ]; then
        exit 10
    elif [ "$COMMAND" == "exit" ]; then
        exit
    elif [ -z "${COMMAND##mc *}" ]; then
        echo "Note: Leading 'mc' is not necessary in this interactive shell"
        COMMAND=$(echo "$COMMAND" | cut -b 3-)
    fi

    echo "$COMMAND" | xargs -o mc
    echo ""
done
