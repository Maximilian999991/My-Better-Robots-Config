#!/usr/bin/bash
set -e

NAME="my-better-robots-config"
VERSION="1.0.0"
FOLDER="${NAME}_${VERSION}"

ZIP_NAME="${PWD}/${NAME}_${VERSION}.zip"

TMP_DIR=$(mktemp -d)
BUILD_TARGET="${TMP_DIR}/${FOLDER}"

mkdir -p "$BUILD_TARGET"

rsync -a --exclude={'.git*','build.sh','*.zip','*.md','.*'} "${PWD}/" "${BUILD_TARGET}/"

(cd "$TMP_DIR" && zip -rq "${ZIP_NAME}" "$FOLDER")

rm -rf "$TMP_DIR"

echo "Erstellt: ${ZIP_NAME}"
