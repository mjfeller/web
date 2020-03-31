#!/bin/sh
cd $(dirname $0)/www/git || exit

repos=$HOME/prog/personal/*

generate() {
	rm -r $(basename $1)
	mkdir -p $(basename $1)
	(cd $(basename $1) && stagit $1)
}

for dir in $repos; do
	generate $dir
done
stagit-index $repos > index.html
