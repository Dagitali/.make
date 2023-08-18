# git.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates Git configuration and shell integration.
# See https://www.gnu.org/software/make/manual/make.html.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://web.mit.edu/gnu/doc/html/make_6.html


# SECTION: INTERNAL VARIABLES =============================================== #

### File System ###

lib := $(BUILD_DIR)/.$(shell)/lib/git

### URLs ###

git_base_url := $(gh_raw_url)/git/git/HEAD


# SECTION: PHONY TARGETS ==================================================== #

## git: Install Git configuration files.
.PHONY: git
git: $(BUILD_DIR)/.gitconfig

## git-lib: Install Git-related shell libraries.
.PHONY: git-lib
git-lib: $(lib)/git-completion.$(shell) $(lib)/git-prompt.sh


# SECTION: FILE TARGETS ===================================================== #

$(lib)/git-completion.$(shell) $(lib)/git-prompt.sh:
	$(call msg,Creating file "$@")
	@$(mkdir) $(@D)
	@$(curl) $@ $(git_base_url)/contrib/completion/$(@F)

$(BUILD_DIR)/.gitconfig:
	$(call msg,Creating file "$@")
	@$(mkdir) $(@D)
	@source .env; \
	cat etc/.gitconfig \
	| envsubst >$@
