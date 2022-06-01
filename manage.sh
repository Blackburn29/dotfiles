#!/bin/bash

#COLORS
CYAN='\033[0;36m'
RED='\033[0;91m'
GREEN='\033[0;32m'
NONE='\033[0m'

DIR=""
if [ -x "$(command -v readlink)" ]; then
    DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

elif [ -x "$(command -v greadlink)" ]; then
    DIR="$(cd -P "$(dirname "$(greadlink -f "${BASH_SOURCE[0]}")")" && pwd)"
else
    echo -e "${RED} Failed to get current working directory. Cannot continue!${NONE}"
    exit 1
fi

echo "$DIR"


manage() {
    function_name="manage_$1"
    MANAGE_FILE="./$1/manage.sh"

    if [ -n "$(type -t $function_name)" ] && [ "$(type -t $function_name)" = "function" ]; then
        $function_name "$@"
    elif [ -f "$MANAGE_FILE" ]; then
        $MANAGE_FILE "$@"
    else
        echo -e "${RED}Manage script does not exist for $1.${NONE}"
        return 1
    fi
}

args="$@"
if [ $# -eq 0 ]; then
    args=( bash vim termite i3 picom conky polybar rofi)
fi
for arg in ${args[@]}; do
    echo -e "${CYAN}[$arg]${NONE}"
    manage "$arg" && echo -e "${GREEN}Configuration for $arg complete!${NONE}"
done
