#!/bin/bash -e

cd "$(dirname ${0})"

if [ ! -e .env ]; then
  echo "create .env"
  cp .env.example .env
fi

if [ ! -e .envrc ]; then
  echo "create .envrc"
  cp .envrc.example .envrc
fi

./keys/generate
