# docker.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Abstracts "docker" command activities.
# See https://www.gnu.org/software/make/manual/make.html.
#
# REFERENCES:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: EXTERNAL VARIABLES =============================================== #

DOCKER_IMAGE_NAME ?=

ifeq ($(DOCKER_IMAGE_NAME),)
	DOCKER_COMPOSE_CFG ?= docker-compose.yaml
else
	DOCKER_COMPOSE_CFG ?= docker-compose.$(DOCKER_IMAGE_NAME).yaml
endif


# SECTION: MACROS =========================================================== #

# Executes `docker compose` command.
define docker
cd "$(dir $(DOCKER_COMPOSE_CFG))"; \
docker compose --file "$(notdir $(DOCKER_COMPOSE_CFG))" $(1); \
cd -
endef


# SECTION: PHONY TARGETS ==================================================== #

## docker-down: Stops and removes Docker container
.PHONY: docker-down
docker-down: $(DOCKER_COMPOSE_CFG)
	$(call msg,Stopping and removing Docker container defined in $<)
	@$(call docker,down --remove-orphans)

## docker-up: Creates and starts Docker container
.PHONY: docker-up
docker-up: $(DOCKER_COMPOSE_CFG)
	$(call msg,Creating and starting Docker container defined in $<)
	@$(call docker,up --detach)


# SECTION: FILE TARGETS ===================================================== #

$(DOCKER_COMPOSE_CFG):
	@$(mkdir) $@; \
	touch $@
