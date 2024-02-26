#!/usr/bin/env bash

set -euxo pipefail

shfmt --language-dialect bash --write \
	./**/*.bash

dprint fmt
