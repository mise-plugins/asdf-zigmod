#!/usr/bin/env bash

set -euxo pipefail

shopt -s globstar

shellcheck --shell=bash --external-sources \
	bin/* --source-path=lib/ \
	lib/*.bash \
	scripts/*.bash

shfmt --language-dialect bash --diff \
	./**/*.bash

dprint check

typos . .github .vscode
