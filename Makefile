# Makefile
# Setup
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


# SECTION: MAKE OPTIONS ===================================================== #

SHELL = /bin/bash

export


# SECTION: INCLUDES ========================================================= #

include src/init.mk


# SECTION: EXTERNAL VARIABLES =============================================== #

BUILD_DIR ?= $(HOME)


# SECTION: INTERNAL VARIABLES =============================================== #

### Commands ###

curl = curl --create-dirs --silent --output

### File System ###

shell := $(notdir $(SHELL))

env := $(BUILD_DIR)/.env

### Operating System ###

uname := $(shell uname)
is_macos := $(filter Darwin, $(uname))
is_linux := $(filter Linux, $(uname))

### URLs ###

github_base_url = https://raw.githubusercontent.com
git_base_url = $(github_base_url)/git/git/HEAD


# SECTION: PHONY TARGETS ==================================================== #

# Force the default target execution sequence to display the online help if no
# target is specified in the command line following "make".

.PHONY: all
all: help

## clean: Remove files/directories.
.PHONY: clean
clean:
	rm -rf tmp

## env: Install shell environment variable files.
.PHONY: env
env: $(env)/secrets.env $(env)/settings.env

## install: Complete all installation activities.
.PHONY: install
install: .env env git lib

## lib: Install shell libraries.
.PHONY: lib
lib: lib-git

## test: Run tests.
.PHONY: test
test: clean
	make install BUILD_DIR=tmp

## update: Pull latest changes to project.
.PHONY: update
update: lib


# SECTION: FILE TARGETS ===================================================== #

.env:
	$(eval git_credential_helper = $(if $(is_macos),osxkeychain,store))
	$(eval git_user_name = $(shell read -p "Full Name (Git): " var; echo $$var))
	$(eval git_user_email = $(shell read -p "Email (Git): " var; echo $$var))
	@cat etc/.env \
	| envsubst >$@

$(env)/secrets.env $(env)/settings.env:
	mkdir -p $(@D)
	chmod 700 $(@D)
	touch $@
	chmod 600 $@
