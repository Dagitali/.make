# bash.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates installing and organizing a Bash script library.
#
# See:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://www.gnu.org/software/make/manual/make.html
# 4. https://web.mit.edu/gnu/doc/html/make_1.html

# SECTION: INTERNAL VARIABLES =============================================== #

### File System ###

bash_dir := $(BUILD_DIR)/.bash

### URLs ###

bash_base_url := $(gh_origin_url)/dagitali/.bash.git

# SECTION: PHONY TARGETS ==================================================== #

## bash-lib: Install Bash libraries.
.PHONY: bash-lib
bash-lib: $(bash_dir)/README.md

# SECTION: FILE TARGETS ===================================================== #

$(bash_dir)/README.md:
	$(call msg,Creating library "$(@D)")
	@git clone $(bash_base_url) $(@D)
