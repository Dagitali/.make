# logging.mk
# Setup
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates makefile project logging.
# See https://www.gnu.org/software/make/manual/make.html.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 4. https://web.mit.edu/gnu/doc/html/make_6.html


# SECTION: MACROS =========================================================== #

# Prints a message to STDOUT when a makefile target is executed.
define msg
@printf "$(fg_cyan)$(bold)$(1)...$(reset)\n"
endef
