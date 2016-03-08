#! /bin/sh

# newpost.sh
# alfiepates 2015
# LICENSE: CC0 1.0

# stupid script to generate a new hugo post with the current date prepended.
# doesn't do any verification or anything, will probably break, don't blame me

# usage:
# 	./newpost.sh "post-title-with-dashes-motherfucker"

hugo new "`date +%y-%m-%d`-$1.md"
