# postgres.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates installing the PostgreSQL platform; abstracts command activities
# for using PostgreSQL.
#
# See:
# 1. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 2. https://www.gnu.org/software/make
# 3. https://web.mit.edu/gnu/doc/html/make_1.html
# 4. https://www.postgresql.org/download/macosx

# SECTION: INTERNAL VARIABLES =============================================== #

# Command options
postgres_opts = -h $(POSTGRES_HOST)
postgres_opts += -U $(POSTGRES_USER)
postgres_opts += -p $(POSTGRES_PORT)
postgres_opts += -d $(POSTGRES_DB)

# SECTION: PHONY TARGETS ==================================================== #

## postgresql: Install PostgreSQL.
.PHONY: postgresql
postgresql:
ifeq (,$(shell which psql))
	$(call msg,Installing PostgreSQL platform)
ifeq (Darwin,$(uname))
	@brew install $@@15
endif
endif

## postgres-check: Checks PostgreSQL database server's connection status.
.PHONY: postgres-check
postgres-check:
	$(call msg,Checking PostgreSQL database server's connection status)
	pg_isready $(postgres_opts)

## postgres-login: Connects to PostgreSQL database server via command line.
.PHONY: postgres-login
postgres-login:
	$(call msg,Connecting to PostgreSQL database server via command line)
	pgcli $(postgres_opts)
