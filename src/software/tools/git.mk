# git.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates configuring the "git" command.
#
# See:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://www.gnu.org/software/make/manual/make.html
# 4. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: PHONY TARGETS ==================================================== #

## git: Install Git configuration files.
.PHONY: git
git: $(BUILD_DIR)/.gitconfig


# SECTION: FILE TARGETS ===================================================== #

$(BUILD_DIR)/.gitconfig:
	$(call msg,Creating file "$@")
	@$(mkdir) $(@D)
	@source .env; \
	cat etc/.gitconfig \
	| envsubst >$@
