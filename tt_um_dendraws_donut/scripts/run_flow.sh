#! /bin/bash

set -e

./tt/tt_tool.py --create-user-config --openlane2
./tt/tt_tool.py --harden --openlane2
./tt/tt_tool.py --create-png --openlane2
