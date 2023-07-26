#!/usr/bin/env bash

set -euxo pipefail

shopt -s globstar

shfmt --language-dialect bash --write \
	./**/*.bash

dprint fmt
