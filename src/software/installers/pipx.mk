# pipx.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates pipx activities.
#
# See:
# 1. https://pypa.github.io/pipx/installation
# 2. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 3. https://www.gnu.org/software/make
# 4. https://web.mit.edu/gnu/doc/html/make_1.html

# SECTION: PHONY TARGETS ==================================================== #

## pipx: Install "pipx" command.
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
