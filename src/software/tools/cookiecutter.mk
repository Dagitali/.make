# cookiecutter.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates installing the "cookiecutter" command.
#
# See:
# 1. https://cookiecutter.readthedocs.io/en/stable/installation.html
# 2. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 3. https://www.gnu.org/software/make
# 4. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: PHONY TARGETS ==================================================== #

## cookiecutter: Install Cookiecutter.
.PHONY: cookiecutter
cookiecutter:
ifeq (,$(shell which cookiecutter))
	$(call msg,Installing command "$@")
ifeq (Darwin,$(uname))
	@brew install $@
else
	@pipx install $@
endif
endif
