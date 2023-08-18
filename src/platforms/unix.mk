# unix.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates customizations for Unix-like operating systems.
# See https://www.gnu.org/software/make/manual/make.html.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://web.mit.edu/gnu/doc/html/make_6.html


# SECTION: INTERNAL VARIABLES =============================================== #

### Operating System (OS) ###

uname := $(shell uname)
is_macos := $(filter Darwin, $(uname))
is_linux := $(filter Linux, $(uname))

### Shell ###

shell := $(notdir $(SHELL))
