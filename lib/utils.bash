#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/nektro/zigmod"
TOOL_NAME="zigmod"

TOOL_TEST="zigmod version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3-
}

list_all_versions() {
  list_github_tags
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  local platform

  case "$OSTYPE" in
  darwin*) platform="macos" ;;
  linux*) platform="linux" ;;
  *) fail "Unsupported platform" ;;
  esac

  local architecture

  case "$(uname -m)" in
  x86_64*) architecture="x86_64" ;;
  aarch64 | arm64) architecture="aarch64" ;;
  *) fail "Unsupported architecture" ;;
  esac

  # Snapshot of the addressies are below
  #   - https://github.com/nektro/zigmod/releases/download/r83/zigmod-x86_64-linux
  # Note
  #   - "zigmod" uploads non archived binary files to the GitHub releases.
  #   - "zigmod" changed versioning prefix from "v*" to "r*". See `../bin/latest-stable` for futher detail
  #   - Earlier than v9 having different naming style for the assets
  #       - https://github.com/nektro/zigmod/releases/tag/r75
  #       - https://github.com/nektro/zigmod/releases/tag/v21
  #       - https://github.com/nektro/zigmod/releases/tag/v20-0ef0ceb
  #       - https://github.com/nektro/zigmod/releases/tag/v9-a3772ea
  #       - https://github.com/nektro/zigmod/releases/tag/v8-1993719 # different
  #       - https://github.com/nektro/zigmod/releases/tag/v7-b0fd757 # more different!
  local url="$GH_REPO/releases/download/${version}/zigmod-${architecture}-${platform}"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="${3%/bin}/bin"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"

    cp "${ASDF_DOWNLOAD_PATH}/zigmod" "$install_path"

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error occurred while installing $TOOL_NAME $version."
  )
}
