# dbt.mk
# .make
#
# Copyright © 2023 Dagitali LLC. All rights reserved.
#
# Facilitates installing the "dbt" command; abstracts "dbt" command activities.
# See https://docs.getdbt.com/docs/core/homebrew-install.
#
# REFERENCES:
# 1. https://docs.getdbt.com/docs/running-a-dbt-project/run-your-dbt-projects
# 2. https://github.com/dbt-labs/dbt-core/blob/main/Makefile
# 3. https://github.com/dbt-labs/dbt-utils/blob/main/Makefile
# 4. https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html
# 5. https://www.gnu.org/software/make
# 6. https://web.mit.edu/gnu/doc/html/make_1.html


# SECTION: PHONY TARGETS ==================================================== #

## postgresql: Install "dbt" command.
.PHONY: dbt
dbt:
ifeq (,$(shell which dbt))
	$(call msg,Installing command "$@")
ifeq (Darwin,$(uname))
	@brew install $@@15
endif
endif

.PHONY: dbt-adv
dbt-adv: dbt-clean dbt-debug dbt-deps dbt-common dbt-debug

.PHONY: dbt-basic
dbt-basic: dbt-clean dbt-debug dbt-common dbt-debug

.PHONY: dbt-common
dbt-common: dbt-seed dbt-run dbt-test

## dbt-build: Builds dbt project's models, seeds, snapshots, and tests.
.PHONY: dbt-build
dbt-build:
	$(call msg,Building dbt project's models, seeds, snapshots, and tests)
	@dbt clean

## dbt-clean: Deletes dbt project's temporary folders.
.PHONY: dbt-clean
dbt-clean:
	$(call msg,Deleting dbt project's temporary folders)
	@dbt clean

## dbt-debug: Tests dbt project's database connection, and show dbt info.
.PHONY: dbt-debug
dbt-debug:
	$(call msg,Testing dbt project's database connection, and show dbt info)
	@dbt debug

## dbt-deps: Pulls dbt project's most recent dependencies.
.PHONY: dbt-deps
dbt-deps:
	$(call msg,Pulling dbt project's most recent dependencies)
	@dbt deps

## dbt-docs: Handles dbt project documentation operations.
.PHONY: dbt-docs
dbt-docs: dbt-generate dbt-serve

## dbt-generate: Generates dbt project's documentation website.
.PHONY: dbt-generate
dbt-generate:
	$(call msg,Generating dbt project's documentation website)
	@dbt docs generate

## dbt-run: Executes dbt project's SQL models against current data targets.
.PHONY: dbt-run
dbt-run:
	$(call msg,Executing dbt project's SQL models against current data targets)
	@dbt run

## dbt-seed: Loads dbt project's CSV files to current data targets.
.PHONY: dbt-seed
dbt-seed:
	$(call msg,Loading dbt project's CSV files to current data targets)
	@dbt seed

## dbt-serve: Serves dbt project's documentation website.
.PHONY: dbt-serve
dbt-serve:
	$(call msg,Serving dbt project's documentation website)
	@dbt docs serve

## dbt-test: Tests dbt project's models, sources, snapshots, and seeds.
.PHONY: dbt-test
dbt-test:
	$(call msg,Testing dbt project's models, sources, snapshots, and seeds)
	@dbt test
