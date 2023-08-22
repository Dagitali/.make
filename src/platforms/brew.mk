# brew.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates Homebrew activities.
# See https://brew.sh.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: FILE TARGETS ===================================================== #

brew:
ifeq (,$(shell which brew))
	$(call msg,Installing command "$@")
	$(eval url = $(gh_raw_url)/Homebrew/install/HEAD/install.sh)
	@bash -c "$(curl) --location $(url)"
endif
