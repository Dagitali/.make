# init.mk
# Setup
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Centralizes how environment variables and secondary makefiles are included.
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

include src/platforms/git.mk
