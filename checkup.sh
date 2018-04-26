#!/usr/bin/env bash


source ./env.sh

VERBOSE=0

function show_help() {
    echo "bash checkup.sh [-v]"
}


while getopts "h?v" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    v)  VERBOSE=1
        ;;
    esac
done


function main() {

    date

    while IFS='' read -r line || [[ -n "$line" ]]; do

        FLAG=''
        INS_CNT=`nova --os-project-name=${line} list | grep ACTIVE | wc -l | xargs`

        if [ $INS_CNT -eq 0 ]; then
            FLAG='Warning'
        fi

        echo -e "Checking project $line... \tInstances: $INS_CNT \t$FLAG"

        if [ $VERBOSE -eq 1 ];
        then
            nova --os-project-name=${line} list
            echo ""
        fi

    done < "list.txt"

    deactivate
}

main "$@"