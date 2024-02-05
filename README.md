# asdf-zigmod [![Build](https://github.com/kachick/asdf-zigmod/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/kachick/asdf-zigmod/actions/workflows/build.yml?query=branch%3Amain) [![Lint](https://github.com/kachick/asdf-zigmod/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/kachick/asdf-zigmod/actions/workflows/lint.yml?query=branch%3Amain) [![mise](https://github.com/kachick/asdf-zigmod/actions/workflows/mise.yml/badge.svg?branch=main)](https://github.com/kachick/asdf-zigmod/actions/workflows/mise.yml?query=branch%3Amain)

[zigmod](https://github.com/nektro/zigmod) plugin for the [asdf version manager](https://asdf-vm.com).\
Tested also [mise](https://github.com/jdx/mise).

# Contents

- [asdf-zigmod   ](#asdf-zigmod---)
- [Contents](#contents)
- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add zigmod https://github.com/kachick/asdf-zigmod.git
```

[short-name specifier is also available](https://github.com/asdf-vm/asdf-plugins/blob/82969331df11ba93e8bcfde89fc22da5f5874ac4/plugins/zigmod#L1) when you don't turn [disable_plugin_short_name_repository](https://asdf-vm.com/manage/configuration.html#disable-plugin-short-name-repository)

```shell
asdf plugin add zigmod
```

zigmod:

```console
# Show all installable versions
$ asdf list-all zigmod

# Install specific version
$ asdf install zigmod latest

# NOTE:
#   - This plugin supports zigmod versions v51 or later
#   - r* is newer prefix than v*

# Set a version globally (on your ~/.tool-versions file)
$ asdf global zigmod latest

# Now zigmod commands are available
$ zigmod version
zigmod r83 linux x86_64 musl
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](CONTRIBUTING.md).

# License

See [LICENSE](LICENSE) © [Kenichi Kamiya](https://github.com/kachick/)
