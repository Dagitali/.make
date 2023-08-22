# Makefile
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Faciliates automation for setting up Unix-based systems.
# See https://www.gnu.org/software/make/manual/make.html.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://www.gnu.org/software/make/manual/html_node/Include.html
# 4. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: MAKE OPTIONS ===================================================== #

SHELL = /bin/bash

export


# SECTION: INCLUDES ========================================================= #

include src/init.mk


# SECTION: PHONY TARGETS ==================================================== #

# Force the default target execution sequence to display the online help if no
# target is specified in the command line following "make".

.PHONY: all
all: help

## clean: Remove files/directories.
.PHONY: clean
clean:
	$(call msg,Removing all temporary project artifacts)
	@$(rm) tmp

## install: Complete all installation activities.
.PHONY: install
install: .env env git lib

## lib: Install shell libraries.
.PHONY: lib
lib: bash-lib git-lib

## test: Run tests.
.PHONY: test
test: clean
	$(call msg,Testing key makefile targets)
	@make install BUILD_DIR=tmp

## update: Pull latest changes to project.
.PHONY: update
update: lib
