# git.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates installing a Bash script library for enhancing "git" command
# usage.
#
# See:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://www.gnu.org/software/make/manual/make.html
# 4. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: PHONY TARGETS ==================================================== #

## git-lib: Install Git-related shell libraries.
.PHONY: git-lib
git-lib: $(lib)/git/git-completion.$(shell) $(lib)/git/git-prompt.sh


# SECTION: FILE TARGETS ===================================================== #

$(lib)/git/git-completion.$(shell) $(lib)/git/git-prompt.sh:
	$(call msg,Creating file "$@")
	$(eval url = $(gh_raw_url)/git/git/HEAD/contrib/completion/$(@F))
	@$(mkdir) $(@D)
	@$(curl) --create-dirs --output $@ $(url)
