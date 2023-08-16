# Makefile
# Setup
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Faciliates automation for common project operations.
# See https://www.gnu.org/software/make/manual/make.html.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://www.gnu.org/software/make/manual/html_node/Include.html


# SECTION: MAKE OPTIONS ===================================================== #

SHELL = /bin/bash


# SECTION: INCLUDES ========================================================= #

ifneq (,$(wildcard $./.env))
	include .env
	export
endif


# SECTION: EXTERNAL VARIABLES =============================================== #

BUILD_DIR ?= $(HOME)


# SECTION: INTERNAL VARIABLES =============================================== #

### Commands ###

curl = curl --create-dirs --silent --output

### File System ###

shell := $(notdir $(SHELL))

env := $(BUILD_DIR)/.env
lib := $(BUILD_DIR)/.$(shell)/lib

### Formatting ###

# C-style octal code representing an ASCI escape character.
esc := \033

# Setting the text intensity/emphasis of STDOUT.
reset := $(esc)[0m

# Setting the text color of STDOUT.
fc_cyan := $(esc)[0;36m

### URLs ###

github_base_url = https://raw.githubusercontent.com
git_base_url = $(github_base_url)/git/git/HEAD


# SECTION: MACROS =========================================================== #

# "Targets" section line item of the "make" command's online help.
define target
$(fc_cyan)%-20s$(reset) %s
endef
export target


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

## env: Install Git configuration files.
.PHONY: git
git: $(BUILD_DIR)/.gitconfig

## help: Show this help message.
.PHONY: help
help:
# Use the makefile set as a data source to display a lexicographically
# sorted, color-formatted list of targets.
#
# Note:
# 1. "cat" outputs a space-delimited list of makefiles -- the main makefile
#    (i.e., "Makefile") & secondary makefiles (i.e., "*.mk").
# 2. "grep" filters makefiles for targets & their descriptions.
	@echo 'usage: make [target]'
	@echo
	@echo 'targets:'
	@cat $(MAKEFILE_LIST) \
	| grep -E '^## [0-9a-zA-Z_-]+: .*$$' \
	| sed -e 's/## //' \
	| sort \
	| awk -F: '{printf "  $(target)\n", $$1, $$2}'

## lib: Complete all installation activities.
.PHONY: install
install: .env env git lib

## lib: Install shell libraries.
.PHONY: lib
lib: lib-git

## lib-git: Install Git-related shell libraries.
.PHONY: lib-git
lib-git: $(lib)/git/git-completion.$(shell) $(lib)/git/git-prompt.sh

## test: Run tests.
.PHONY: test
test: clean
	make install BUILD_DIR=tmp

## update: Pull latest changes to project.
.PHONY: update
update: lib


# SECTION: NON-PHONY TARGETS ================================================ #

.env:
	[ "$$(uname)" = Darwin ] \
	&& git_credential_helper=osxkeychain \
	|| git_credential_helper=store; \
	echo GIT_CREDENTIAL_HELPER=$${git_credential_helper} >.env; \
	read -p "Enter your full name to use with Git: " git_user_name; \
	echo GIT_USER_NAME=$${git_user_name} >>.env; \
	read -p "Enter your email address to use with Git: " git_user_email; \
	echo GIT_USER_EMAIL=$${git_user_email} >>.env;

$(env)/secrets.env:
	mkdir -p $(@D)
	chmod 700 $(@D)
	touch $@
	chmod 600 $@

$(env)/settings.env:
	mkdir -p $(@D)
	chmod 700 $(@D)
	touch $@
	chmod 600 $@

$(lib)/git/git-completion.$(shell):
	mkdir -p $(@D)
	$(curl) $@ $(git_base_url)/contrib/completion/$(@F)

$(lib)/git/git-prompt.sh:
	mkdir -p $(@D)
	$(curl) $@ $(git_base_url)/contrib/completion/$(@F)

$(BUILD_DIR)/.gitconfig:
	mkdir -p $(@D)
	cat etc/templates/.gitconfig \
	| envsubst >$@
