# commands.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Reduces shell command verbosity via constants representing prefixes to such
# commands.
#
# See:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://www.gnu.org/software/make/manual/make.html
# 4. https://web.mit.edu/gnu/doc/html/make_6.html


# SECTION: EXTERNAL VARIABLES =============================================== #

### Commands ###

DATE ?= date
TAR  ?= tar


# SECTION: INTERNAL VARIABLES =============================================== #

### Commands ###

# Command options for no verbosity.
ifeq ($(VERBOSE),0)
q := --quiet
s := --silent
endif

# Command options for verbosity.
ifneq ($(VERBOSE),0)
v := -v
endif

# Command prefix for transferring data.
curl := curl $(s) --fail --show-error

# Command prefix for creating directores.
mkdir := mkdir $(v) -p

# Command prefix for removing directores/files.
rm := rm $(v) -rf
