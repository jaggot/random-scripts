#!/bin/sh
$(ls ~/scripts/*.sh | dmenu -p "Which script?" -l 10 -i)
