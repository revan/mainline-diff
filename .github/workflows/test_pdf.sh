#!/bin/bash
TEXT="$(printf "$(git rev-parse --short HEAD)\n%.0s" {1..20})"
convert -font FreeMono -pointsize 72 label:"${TEXT}" /tmp/branch.pdf
