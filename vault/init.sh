#!/usr/bin/env bash

set -e -u

cd $(dirname $0)

vault login
vault policy write concourse ./concourse-policy.hcl
vault secrets enable -version=1 -path=concourse kv
