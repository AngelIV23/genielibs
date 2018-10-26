################################################################################
#                                                                              #
#                      Cisco Systems Proprietary Software                      #
#        Not to be distributed without consent from Test Technology            #
#                               Cisco Systems, Inc.                            #
#                                                                              #
################################################################################
#                           Genie Libs Makefile
#
# Author:
#   Siming Yuan        (siyuan@cisco.com)    - CSG
#   Jean-Benoit Aubin  (jeaubin@cisco.com)   - CSG
#
# Support:
#    python-core@cisco.com
#
# Version:
#   v2.1
#
# Date:
#   April 2018
#
# About This File:
#   This script will build individual Genie libs modules into Python PyPI packages.
#    Make sure all requirements are met before adding new package names to
#    PACKAGES variable.
#
# Requirements:
#    1. Module name is the same as package name.
#    2. setup.py file is stored within the module folder
################################################################################

# Variables
PKG_NAME      = genie/libs
BUILD_ROOT    = $(shell pwd)/__build__
OUTPUT_DIR    = $(BUILD_ROOT)/dist
BUILD_CMD     = python setup.py bdist_wheel --dist-dir=$(OUTPUT_DIR)
PROD_USER     = pyadm@pyats-ci
PROD_PKGS     = /auto/pyats/packages/cisco-shared
PROD_SCRIPTS  = /auto/pyats/bin
TESTCMD       = ./tests/runAll --path tests/
WATCHERS      = asg-genie-dev@cisco.com
HEADER        = [Watchdog]
PYPIREPO      = pypitest

# Development pkg requirements
DEPENDENCIES  = restview psutil Sphinx wheel asynctest
DEPENDENCIES += setproctitle sphinxcontrib-napoleon sphinx-rtd-theme httplib2
DEPENDENCIES += pip-tools Cython requests

# Internal variables.
# (note - build examples & templates last because it will fail uploading to pypi
#  due to duplicates, and we'll for now accept that error)
PYPI_PKGS      = conf ops robot sdk

ALL_PKGS       = $(PYPI_PKGS)

# force cythonize if uploading to pypi
ifeq ($(UPLOADPYPI), true)
    DEVNET = true
endif

ifeq ($(MAKECMDGOALS), devnet)
    DEVNET = true
    INCLUDE_TESTS = false
endif

ifeq ($(INCLUDE_TESTS), true)
    BUILD_CMD += --include-tests
endif

# build options
ifeq ($(DEVNET), true)
    BUILD_CMD += --devnet
endif

# add upload flag ONLY if it's a devnet build asked for upload
ifeq ($(DEVNET)$(UPLOADPYPI), truetruetrue)
    BUILD_CMD += upload -r $(PYPIREPO)
endif


.PHONY: help docs distribute_docs clean check\
        develop undevelop distribute test $(ALL_PKGS)

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo ""
	@echo "     --- common actions ---"
	@echo ""
	@echo "    check                check setup.py content"
	@echo " clean                remove the build directory ($(BUILD_ROOT))"
	@echo " help                 display this help"
	@echo " test                 run all unittests in an efficient manner"
	@echo " develop              set all package to development mode"
	@echo " undevelop            unset the above development mode"
	@echo ""
	@echo "     --- build all targets ---"
	@echo ""
	@echo " all                  make all available pyATS packages"
	@echo ""
	@echo "     --- build specific targets ---"
	@echo ""
	@echo " conf                 build genie.libs.conf package"
	@echo " ops                  build genie.libs.ops package"
	@echo " sdk                  build genie.libs.sdk package"
	@echo " robot                build genie.libs.robot package"
	@echo ""
	@echo "     --- distributions to production environment ---"
	@echo ""
	@echo " distribute           distribute built pkgs to production server"
	@echo ""
	@echo "     --- redirects ---"
	@echo " docs             create all documentation locally. This the same as"
	@echo "                  running 'make docs' in ./docs/"
	@echo " distribute_docs  release local documentation to website. This is"
	@echo "                  the same as running 'make distribute' in ./docs/"
	@echo ""
	@echo "     --- build arguments ---"
	@echo " DEVNET=true              build for devnet style (cythonized, no ut)"
	@echo " INCLUDE_TESTS=true       build include unittests in cythonized pkgs"

docs:
	@echo "No documentation to build for genie.libs"

clean:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Removing make directory: $(BUILD_ROOT)"
	@rm -rf $(BUILD_ROOT)
	@$(foreach dir,$(ALL_PKGS),(cd pkgs/$(dir)-pkg && python setup.py clean) &&) :
	@echo "Removing *.pyc *.c and __pycache__/ files"
	@find . -type f -name "*.pyc" | xargs rm -vrf
	@find . -type f -name "*.c" | xargs rm -vrf
	@find . -type d -name "__pycache__" | xargs rm -vrf
	@echo ""
	@echo "Done."
	@echo ""

develop:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Installing development dependencies"
	@pip install $(DEPENDENCIES)
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Setting up development environment"
	@$(foreach dir,$(ALL_PKGS),(cd pkgs/$(dir)-pkg && python setup.py develop --no-deps -q) &&) :
	@echo ""
	@echo "Done."
	@echo ""

undevelop:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Removing development environment"
	@$(foreach dir,$(ALL_PKGS),(cd pkgs/$(dir)-pkg && python setup.py develop -q --no-deps --uninstall) &&) :
	@echo ""
	@echo "Done."
	@echo ""

distribute:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Copying all distributable to $(PROD_PKGS)"
	@test -d $(OUTPUT_DIR) || { echo "Nothing to distribute! Exiting..."; exit 1; }
	@ssh -q $(PROD_USER) 'test -e $(PROD_PKGS)/$(PKG_NAME) || mkdir $(PROD_PKGS)/$(PKG_NAME)'
	@scp $(OUTPUT_DIR)/* $(PROD_USER):$(PROD_PKGS)/$(PKG_NAME)/
	@echo ""
	@echo "Done."
	@echo ""

all: $(ALL_PKGS)
	@echo ""
	@echo "Done."
	@echo ""

$(ALL_PKGS):
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Building pyATS distributable: $@"
	@echo ""

	mkdir -p $(OUTPUT_DIR)/
	cd pkgs/$@-pkg/; $(BUILD_CMD)

	@echo "Completed building: $@"
	@echo ""

test:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Running all unit tests..."
	@echo ""

	@$(TESTCMD)

	@echo "Completed unit testing"
	@echo ""

check:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Checking setup.py consistency..."
	@echo ""

	@$(foreach dir,$(ALL_PKGS),(cd pkgs/$(dir)-pkg && python setup.py check) &&) :

	@echo "Done"
	@echo ""
