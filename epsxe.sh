#!/usr/bin/env bash

LD_PRELOAD=libcurl.so.3 /opt/epsxe/epsxe "$@"
