# Contributing

Maintaining this repository assumes that you are not using old versions of bash such as 3.x, which is included in MacOS\
I recommend using the [Nix package manager](https://nixos.org/) to prepare base environments.\
This repository contains the [flake.nix](flake.nix).

After installing asdf, running below command in this repo finishes setups.

```console
$ asdf plugin-add cargo-make https://github.com/kachick/asdf-cargo-make.git # Needed when you turned "disable_plugin_short_name_repository"
$ asdf install cargo-make
$ makers setup
cargo-make 0.36.2 is already installed
dprint 0.32.1 is already installed
shellcheck 0.8.0 is already installed
shfmt 3.5.1 is already installed
[cargo-make] INFO - Build Done in 1.09 seconds.
```

`help` shows providing tasks for developing

```console
$ makers help
check - Should pass before merging PR
check_no_git_diff - asdf built-in "plugin test" requires git managed codes. This prevents unexpected run
empty - Empty Task
format - Run formatters with changes
help - Might help you - (This one)
lint - Run linters without changes
setup - Install dependencies
test - Run tests with `asdf plugin test`
```

`check` task should be passed after your commits

```console
$ makers check
...
```

## How to release

Add and push tag that have `v` prefix
