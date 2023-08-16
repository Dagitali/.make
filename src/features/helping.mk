# helping.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Enables the "make" command's online help for this makefile set.
# See https://www.gnu.org/software/make/manual/make.html.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://web.mit.edu/gnu/doc/html/make_6.html


# SECTION: MACROS =========================================================== #

# "Targets" section line item of the "make" command's online help.
define target
$(fc_cyan)%-20s$(reset) %s
endef


# SECTION: PHONY TARGETS ==================================================== #

## help: Show this help message.
.PHONY: help
help:
# Use the makefile set as a data source to display a lexicographically
# sorted, color-formatted list of targets.
#
# Note:
# 1. "cat" outputs a space-delimited list of makefiles -- the main makefile
#    (i.e., "Makefile") & secondary makefiles (i.e., "*.mk").
# 2. "grep" filters makefiles for targets & their descriptions.
	@echo 'usage: make [target]'
	@echo
	@echo 'targets:'
	@cat $(MAKEFILE_LIST) \
	| grep -E '^## [0-9a-zA-Z_-]+: .*$$' \
	| sed -e 's/## //' \
	| sort \
	| awk -F: '{printf "  $(target)\n", $$1, $$2}'
