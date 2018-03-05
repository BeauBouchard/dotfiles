#!/bin/bash

awk 'END {print NR}' /proc/net/tcp
