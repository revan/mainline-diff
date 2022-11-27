#!/bin/bash
# Creates unique image containing current branch name.
convert -background darkgreen -fill purple -pointsize 72 label:"$(git branch --show-current)" /tmp/branch.png