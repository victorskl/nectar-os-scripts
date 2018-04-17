#!/usr/bin/env bash


source ./env.sh

function main() {

    while IFS='' read -r line || [[ -n "$line" ]]; do
        echo "Checking project $line..."
        nova --os-project-name=${line} list
        echo ""
    done < "list.txt"

    deactivate
}

main "$@"