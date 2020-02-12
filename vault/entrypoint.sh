#!/bin/sh -e

# vault entrypoint
docker-entrypoint.sh "$@" &
pid=$!

if [ -n "${POST_COMMAND}" ]; then
  while [ -x /proc/$pid ]; do
    sleep 1
    set +e
    vault status
    status=$?
    # 0: success
    # 1: error
    # 2: sealed
    set -e
    if [ $status -eq 0 -o $status -eq 2 ]; then
      ${POST_COMMAND}
      break
    fi
  done
fi

wait $pid
