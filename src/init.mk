# init.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Decouples dependency inclusion (environment variables, secondary makefiles)
# from the main makefile. These dependencies must be included in the order
# specified below.
# See https://www.gnu.org/software/make/manual/make.html.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://www.gnu.org/software/make/manual/html_node/Include.html
# 4. https://web.mit.edu/gnu/doc/html/make_6.html


# SECTION: INCLUDES ======================================================== #

### Secrets ###

-include $(HOME)/.env/secrets.env

### Settings ###

-include $(HOME)/.env/settings.env
-include .env

### Secondary Makefiles ###

include src/features/formatting.mk
include src/features/helping.mk
include src/features/logging.mk

include src/platforms/unix.mk

include src/utilities/commands.mk

include src/platforms/github.mk

include src/platforms/git.mk
