# tree.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates installing the "tree" command.
# See https://cookiecutter.readthedocs.io/en/stable/installation.html.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: PHONY TARGETS ==================================================== #

## tree: Install "tree" command.
.PHONY: tree
tree:
ifeq (,$(shell which tree))
	$(call msg,Installing command "$@")
ifeq (Darwin,$(uname))
	@brew install $@
endif
endif
