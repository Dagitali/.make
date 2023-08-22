# .make

An integrated set of sharable, reusable makefiles for setting up and managing
Unix-based software environments and projects.

## Introduction

.make is intended to simplify software environment/project setups and management
on Unix-like systems, particularly Linux and macOS hosts. It uses the [`make`][make]
command to automate activities such as:

- Installing 3rd-party shell scripts;
- Enhancing how Git is used;
- Starting/stopping Docker containers.

As this project matures, its automations are expected to grow, thereby speeding
up environment/project setup customization and management.

## Background

`make` is a command-line utility for maintaining software project files, typically
source code files. Originally created in 1976 as a software build automation tool
for Unix environments, it can be used more broadly "[to describe any task where
files must be updated automatically from others whenever the others change][make manpage]". This
automation is facilitated via so-called [_makefiles_][makefile], script-like description files
that [declaratively][declarative programming] specify via variable definitions and build rules:

1. A software project's file components;
2. The [dependency graph][dependency graph] of these components (i.e., their interrelationships);
3. The sequence of commands for creating or updating each component.

_Makefile projects_, integrated sets of makefiles, provide a blueprint for a
software project's source code base and its maintenance. In addition, together
with the `make` command, makefile projects serve as the scaffolding for build
activities and more within a software project's development process.

The makefile project presented here, .make, defines variable definitions and
build rules for popular software project platforms (Python, Swift, etc). Its
makefiles are stored in a special folder, conveniently named `.make` that can be
stored in a user's home folder or within the software project itself.

## Getting Started

.make supports 2 UNIX-like operating systems:

- [Linux][Linux]
- [macOS][macOS]

It can indirectly support the [Windows][Windows] operating system if used with Microsoft's
native [Windows Subsystem for Linux (WSL)][WSL] or a 3rd-party emulator like Git BASH
(part of [Git for Windows][Git for Windows]).

To use or test .make, the following software must first be installed on your
system:

- [Git][Git] 2.39.2 or higher
- [GNU Bash][GNU Bash] 3.2.57 or higher
- [GNU Make][GNU Make] 3.81 or higher

In addition, for the purpose of continuous integration/development (CI/CD), the
the optional installation of the following toolchain is encouraged:

- [GitFlow][GitFlow] 0.4.1 or higher
- [pre-commit][pre-commit] 3.3.3 or higher

### Installation

.make is installable as a Git clone. For individuals, we recommend cloning in
your home directory.

```bash
cd ~
git clone https://github.com/dagitali/.make.git
```

Alternatively, teams may prefer to clone .make to a shared, visible directory,
such as `make`.

```bash
cd <path_to_bash_parent_dir>
git clone https://github.com/dagitali/.make.git make
```

### Usage

.make works by running the `make` command from the directory where the project's
makefile was installed (e.g., `~/.make`). The command's basic syntax is:

```bash
make [target]
```

where `[target]` is the name of a file to create or an action to execute. When
run without a specified target, `make` will execute the first target defined in
the makefile. By convention, that target is named `all`. Thus, running `make` is
equivalent to running `make all`.

One particularly useful target defined in .make's makefile is `help`, which prints
to [standard output (stdout)][stdout] online help summarizing some of the makefile's other
more useful targets. This makefile specifies the `help` target as the `all`
target's only prerequisite, meaning it is the first part of the `all` target to
execute. Therefore, running `make all` or `make` is sufficient for printing the
online help.

## Builds and Testing

.make defines two important makefile targets:

1. `install`: Completes all makefile-defined installation actions.
2. `test`: Tests key makefile targets.

For most users, running `make install` one time will be sufficient, as their use
case &ndash; likely their only use case &ndash; is automating the customization of their
Unix-based system.

```bash
cd ~/.make
make install
cd ~
ls -al
```

For users who are interested in contributing to the codebase of .make, they are
encouraged to also run `make test` as part of their testing practice, which will
simulate running `make install` in this project's `tmp` directory.

```bash
cd ~/.make
make test
cd tmp
ls -al
cd ~
```

## Documentation

Documentation for .make is this README itself, plus the documents listed in the
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

[declarative programming]: https://en.wikipedia.org/wiki/Declarative_programming
[dependency graph]: https://en.wikipedia.org/wiki/Dependency_graph
[Git]: https://git-scm.com
[Git for Windows]: https://gitforwindows.org
[GitFlow]: https://github.com/nvie/gitflow
[GNU Bash]: https://www.gnu.org/software/bash
[GNU Make]: https://www.gnu.org/software/make
[Linux]: https://www.linuxfoundation.org
[macOS]: https://www.apple.com/macos
[make]: https://en.wikipedia.org/wiki/Make_(software)
[make manpage]: https://linux.die.net/man/1/make
[makefile]: https://en.wikipedia.org/wiki/Make_(software)#Makefiles
[pre-commit]: https://github.com/pre-commit/pre-commit
[stdout]: https://en.wikipedia.org/wiki/Standard_streams
[Windows]: https://www.microsoft.com/en-us/windows
[WSL]: https://docs.microsoft.com/en-us/windows/wsl/about
