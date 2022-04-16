#!/bin/sh

CMD="$1"

__slack() {
    if[-z "${SLACK_TOKEN}" ]; then
        echo "SLACK_TOKEN must be set"
        exit 1
    fi

    if [ -z "${SLACK_MESSAGE}" ]; then
        echo "SLACK_MESSAGE must be set"
        exit 1
    fi

    curl \ 
        -X POST \
        -H 'Content-type: application/json' \
        --data "{\"text\": \"${SLACK_MESSAGE}\"}" \
        "https://hooks.slack.com/services/${SLACK_TOKEN}"
}

if [ -z "${CMD}" ]; then
    exit 1
fi

echo "[${CMD}] is running"

case "${CMD}" in
    slack)
        __slack
        ;;
    *)
        exit 1
    esac