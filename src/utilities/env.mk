# env.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates environment setup/management.
#
# See:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://www.gnu.org/software/make/manual/make.html
# 4. https://web.mit.edu/gnu/doc/html/make_1.html

# SECTION: INTERNAL VARIABLES =============================================== #

### File System ###

env := $(BUILD_DIR)/.env

# SECTION: PHONY TARGETS ==================================================== #

## env: Install shell environment variable files.
.PHONY: env
env: $(env)/secrets.env $(env)/settings.env

# SECTION: FILE TARGETS ===================================================== #

.env:
	$(call msg,Creating file "$@")
	$(eval git_credential_helper = $(if $(is_macos),osxkeychain,store))
	$(eval git_user_name = $(shell read -p "Full Name (Git): " var; echo $$var))
	$(eval git_user_email = $(shell read -p "Email (Git): " var; echo $$var))
	@cat etc/.env \
	| envsubst >$@

$(env)/secrets.env $(env)/settings.env:
	$(call msg,Creating file "$@")
	@mkdir -p $(@D)
	@chmod 700 $(@D)
	@touch $@
	@chmod 600 $@
