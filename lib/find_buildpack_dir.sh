#!/bin/sh

set -eu -o pipefail

BUILD_DIR="${1?}"

if [[ -f "${BUILD_DIR}/.heroku-buildpack-dir" ]]; then
    BUILDPACK_DIR="$(cat "${BUILD_DIR}/.heroku-buildpack-dir")"
elif [[ -d "${BUILD_DIR}/.heroku/buildpack" ]]; then
    BUILDPACK_DIR="${BUILD_DIR}/.heroku/buildpack"
else
    BUILDPACK_DIR="${BUILD_DIR}/bin"
fi

echo "${BUILDPACK_DIR}"
