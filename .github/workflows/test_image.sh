#!/bin/bash
convert -font FreeMono -background darkgreen -fill purple -pointsize 72 label:"$(git rev-parse --short HEAD)" /tmp/branch.png