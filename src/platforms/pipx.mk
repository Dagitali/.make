# pipx.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates pipx activities.
# See https://pypa.github.io/pipx/installation/.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: FILE TARGETS ===================================================== #

## pipx: Install pipx.
.PHONY: pipx
pipx:
ifeq (,$(shell which pipx))
	$(call msg,Installing command "$@")
ifeq (Darwin,$(uname))
	@brew install $@
	@pipx ensurepath
else
	@python3 -m pip install --user $@
	@python3 -m pipx ensurepath
endif
endif
