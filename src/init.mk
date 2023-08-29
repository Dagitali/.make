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

### Operating System (OS) ###

uname := $(shell uname)
is_macos := $(filter Darwin, $(uname))
is_linux := $(filter Linux, $(uname))

### Shell ###

shell := $(notdir $(SHELL))


# SECTION: INCLUDES ======================================================== #

### Secrets ###

-include $(BUILD_DIR)/.env/secrets.env

### Settings ###

-include $(BUILD_DIR)/.env/settings.env
-include $(MAKE_HOME)/.env

### Secondary Makefiles ###

include $(MAKE_HOME)/src/unames/$(uname).mk

include $(MAKE_HOME)/src/features/formatting.mk
include $(MAKE_HOME)/src/features/helping.mk
include $(MAKE_HOME)/src/features/logging.mk

include $(MAKE_HOME)/src/utilities/env.mk
include $(MAKE_HOME)/src/utilities/commands.mk

include $(MAKE_HOME)/src/services/github.mk

include $(MAKE_HOME)/src/software/installers/brew.mk
include $(MAKE_HOME)/src/software/installers/pipx.mk

include $(MAKE_HOME)/src/software/libraries/bash.mk
include $(MAKE_HOME)/src/software/libraries/git.mk

include $(MAKE_HOME)/src/software/tools/cookiecutter.mk
include $(MAKE_HOME)/src/software/tools/docker.mk
include $(MAKE_HOME)/src/software/tools/git.mk
include $(MAKE_HOME)/src/software/tools/postgres.mk
