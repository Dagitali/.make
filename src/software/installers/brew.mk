# brew.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates Homebrew activities.
#
# See:
# 1. https://brew.sh
# 2. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 3. https://www.gnu.org/software/make
# 4. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: PHONY TARGETS ==================================================== #

## brew: Install "brew" command.
.PHONY: brew
brew:
ifeq (,$(shell which brew))
	$(call msg,Installing command "$@")
	$(eval url = $(gh_raw_url)/Homebrew/install/HEAD/install.sh)
	@bash -c "$(curl) --location $(url)"
endif
