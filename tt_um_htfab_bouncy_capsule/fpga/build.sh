#!/bin/bash
f4pga -vv build --flow flow.json
mkdir -p build/log
mv *.log build/log/
