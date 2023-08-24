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
# 4. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: EXTERNAL VARIABLES =============================================== #

### File System ###

BUILD_DIR ?= $(HOME)
MAKE_HOME ?= .


# SECTION: INTERNAL VARIABLES =============================================== #

### File System ###

lib := $(BUILD_DIR)/.$(shell)/lib


# SECTION: INCLUDES ======================================================== #

### Secrets ###

-include $(BUILD_DIR)/.env/secrets.env

### Settings ###

-include $(BUILD_DIR)/.env/settings.env
-include $(MAKE_HOME)/.env

### Secondary Makefiles ###

include $(MAKE_HOME)/src/features/formatting.mk
include $(MAKE_HOME)/src/features/helping.mk
include $(MAKE_HOME)/src/features/logging.mk

include $(MAKE_HOME)/src/utilities/unix.mk
include $(MAKE_HOME)/src/utilities/env.mk
include $(MAKE_HOME)/src/utilities/commands.mk

include $(MAKE_HOME)/src/services/github.mk

include $(MAKE_HOME)/src/platforms/brew.mk
include $(MAKE_HOME)/src/platforms/pipx.mk

include $(MAKE_HOME)/src/platforms/bash.mk
include $(MAKE_HOME)/src/platforms/cookiecutter.mk
include $(MAKE_HOME)/src/platforms/docker.mk
include $(MAKE_HOME)/src/platforms/git.mk
