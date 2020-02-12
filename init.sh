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

if [ ! -e vault/scripts/secrets.json ]; then
  echo "create vault secrets.json"
  cp vault/scripts/secrets.json.example vault/scripts/secrets.json
fi

./keys/generate
