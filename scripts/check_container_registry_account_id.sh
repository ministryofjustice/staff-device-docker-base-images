#!/bin/bash

set -euo pipefail

if [ -z ${SHARED_SERVICES_ACCOUNT_ID} ]; then
  echo "Please set environment variable SHARED_SERVICES_ACCOUNT_ID for shared services";
  exit 1;
fi
