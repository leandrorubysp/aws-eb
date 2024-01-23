#!/bin/bash

# set -x

function get_state() {

    RESULTS=$(grep -E "# Set to 'on' to (enable|put into) maintenance mode" /etc/nginx/conf.d/*.conf)

    IFS=$'\n'
    for RESULT in ${RESULTS}; do
        SERIAL=$(echo ${RESULT} | sed -r -e "s/.*\/(.*)\.conf.*/\1/i")
        STATE=$(echo ${RESULT} | sed -r -e "s/.*default (off|on).*/\1/i")
        echo ${SERIAL} ${STATE}
    done

}

get_state