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
# 4. https://web.mit.edu/gnu/doc/html/make_6.html


# SECTION: MAKE OPTIONS ===================================================== #

SHELL = /bin/bash

export


# SECTION: EXTERNAL VARIABLES =============================================== #

BUILD_DIR ?= $(HOME)
MAKE_HOME ?= .


# SECTION: INTERNAL VARIABLES =============================================== #

### File System ###

env := $(BUILD_DIR)/.env


# SECTION: INCLUDES ========================================================= #

include $(MAKE_HOME)/src/init.mk


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

## env: Install shell environment variable files.
.PHONY: env
env: $(env)/secrets.env $(env)/settings.env

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


# SECTION: FILE TARGETS ===================================================== #

.env:
	$(call msg,Creating file "$@")
	$(eval git_credential_helper = $(if $(is_macos),osxkeychain,store))
	$(eval git_user_name = $(shell read -p "Full Name (Git): " var; echo $$var))
	$(eval git_user_email = $(shell read -p "Email (Git): " var; echo $$var))
	@cat etc/.env \
	| envsubst >$@

$(env)/secrets.env $(env)/settings.env:
	$(call msg,Creating file "$@")
	@mkdir -p $(@D)
	@chmod 700 $(@D)
	@touch $@
	@chmod 600 $@
