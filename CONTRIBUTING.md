# Contributing

After installing asdf, running below command in this repo finishes setups.

```console
$ asdf plugin-add cargo-make https://github.com/kachick/asdf-zigmod.git # Needed when you turned "disable_plugin_short_name_repository"
$ asdf install cargo-make
$ makers setup
cargo-make 0.36.2 is already installed
dprint 0.32.1 is already installed
shellcheck 0.8.0 is already installed
shfmt 3.5.1 is already installed
[cargo-make] INFO - Build Done in 1.09 seconds.
```

`help` shows providing tasks for developping

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
[cargo-make] INFO - makers 0.36.2
[cargo-make] INFO - Build File: Makefile.toml
[cargo-make] INFO - Task: check
[cargo-make] INFO - Profile: development
[cargo-make] INFO - Running Task: lint
[cargo-make] INFO - Running Task: check_no_git_diff
[cargo-make] INFO - Running Task: test
Updating asdf-zigmod to main
Already on 'main'
Your branch is up to date with 'origin/main'.
* Downloading zigmod release r83...
zigmod r83 installation was successful!
zigmod r83 linux x86_64 musl
[cargo-make] INFO - Build Done in 2.65 seconds.
```
