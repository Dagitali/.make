# Setup

A simple makefile for setting up software environments (Linux, macOS, and other
Unix variants).

## Introduction

Setup is intended to simplify setting up new users on Unix-based systems. This
includes Unix variants such as Linux and macOS. It uses the [`make`][make] command to
automate setup customization activities:

- Setting shell environment variables;
- Sourcing custom and 3rd-party shell scripts.

As this project matures, its automations are expected to grow, thereby speeding
up setup customization.

## Getting Started

Setup supports 2 UNIX-based operating systems:

- [Linux][Linux]
- [macOS][macOS]

It can indirectly support the [Windows][Windows] operating system if used with Microsoft's
native [Windows Subsystem for Linux (WSL)][WSL] or a 3rd-party emulator like Git BASH
(part of [Git for Windows][Git for Windows]).

To use or test Setup, the following software must first be installed on your
system:

- [Git][Git] 2.39.2 or higher
- [GNU Bash][GNU Bash] 3.2.57 or higher
- [GNU Make][GNU Make] 3.81 or higher

In addition, for the purpose of continuous integration/development (CI/CD), the
the optional installation of the following toolchain is encouraged:

- [GitFlow][GitFlow] 0.4.1 or higher
- [pre-commit][pre-commit] 3.3.3 or higher

### Installation

Setup is installable as a single [makefile][makefile]. For most use cases, the appropriate
installation target for this makefile will be a user's home directory, like as
follows:

```bash
cd ~
curl -fsSL https://raw.githubusercontent.com/Dagitali/makefile-setup/HEAD/Makefile >Makefile
```

### Usage

Setup works by running the `make` command from the directory where the project's
makefile was installed. The command's basic syntax is:

```bash
make [target]
```

where `[target]` is the name of a file to create or an action to execute. When
run without a specified target, `make` will execute the first target defined in
the makefile. By convention, that target is named `all`. Thus, running `make` is
equivalent to running `make all`.

One particularly useful target defined in Setup's makefile is `help`, which prints
to [standard output (stdout)][stdout] online help summarizing some of the makefile's other
more useful targets. This makefile specifies the `help` target as the `all`
target's only prerequisite, meaning it is the first part of the `all` target to
execute. Therefore, running `make all` or `make` is sufficient for printing the
online help.

## Builds and Testing

Setup defines two important makefile targets:

1. `install`: Completes all makefile-defined installation actions.
2. `test`: Tests key makefile targets.

For most users, running `make install` one time will be sufficient, as their use
case &ndash; likely their only use case &ndash; is automating the customization of their
Unix-based system. For users who are interested in contributing to the codebase
of Setup, they are encouraged to also run `make test` as part of their testing
practice, which will simulate running `make install` in this project's `tmp`
directory.

## Documentation

Documentation for Setup is this README itself, plus the documents listed in the
subsections that follow.

### Community Health

- [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md)
- [`CONTRIBUTING.md`](CONTRIBUTING.md)

### Other

- [`REFERENCES.md`](REFERENCES.md)

## Known Issues

Currently, there are no known issues.

## References

API documentation, tutorials, and other online references and made portions of
this assignment possible. See [REFERENCES.md](REFERENCES.md) for a list of some.

[Git]: https://git-scm.com
[Git for Windows]: https://gitforwindows.org
[GitFlow]: https://github.com/nvie/gitflow
[GNU Bash]: https://www.gnu.org/software/bash
[GNU Make]: https://www.gnu.org/software/make
[Linux]: https://www.linuxfoundation.org
[macOS]: https://www.apple.com/macos
[make]: https://en.wikipedia.org/wiki/Make_(software)
[makefile]: https://en.wikipedia.org/wiki/Make_(software)#Makefiles
[pre-commit]: https://github.com/pre-commit/pre-commit
[stdout]: https://en.wikipedia.org/wiki/Standard_streams
[Windows]: https://www.microsoft.com/en-us/windows
[WSL]: https://docs.microsoft.com/en-us/windows/wsl/about
