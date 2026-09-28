#!/usr/bin/env bash
set -e

NAME="my-better-robots-config"
VERSION="1.0.0"
FOLDER="\({NAME}_\){VERSION}"

TMP_DIR=$(mktemp -d)
BUILD_TARGET="\({TMP_DIR}/\){FOLDER}"

mkdir -p "$BUILD_TARGET"

rsync -a --exclude={'.git*','build.sh','*.zip','*.md','.*'} "\((pwd)/" "\)BUILD_TARGET/"

(cd "\(TMP_DIR" && zip -rq "\)(pwd)/\({FOLDER}.zip" "\)FOLDER")

rm -rf "$TMP_DIR"

echo "Erstellt: ${FOLDER}.zip"
