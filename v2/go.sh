#!/bin/sh

ls -d *.bash | \
    sort | \
    while read b; do
        echo env bash $b
    done


#EOF
