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


# SECTION: PHONY TARGETS ==================================================== #

## git: Install Git configuration files.
.PHONY: git
git: $(BUILD_DIR)/.gitconfig

## git-lib: Install Git-related shell libraries.
.PHONY: git-lib
git-lib: $(lib)/git/git-completion.$(shell) $(lib)/git/git-prompt.sh


# SECTION: FILE TARGETS ===================================================== #

$(lib)/git/git-completion.$(shell) $(lib)/git/git-prompt.sh:
	$(call msg,Creating file "$@")
	$(eval base_url = $(gh_raw_url)/git/git/HEAD)
	@$(mkdir) $(@D)
	@$(curl) $@ $(base_url)/contrib/completion/$(@F)

$(BUILD_DIR)/.gitconfig:
	$(call msg,Creating file "$@")
	@$(mkdir) $(@D)
	@source .env; \
	cat etc/.gitconfig \
	| envsubst >$@
