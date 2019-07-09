#!/bin/bash
mkdir abinit > /dev/null 2>&1
cd abinit
~/gdown.pl $1 out.xz > /dev/null 2>&1
unxz out.xz > /dev/null 2>&1
tar xf out > /dev/null 2>&1     
dir=`tar tf out | head -1 | cut -f1 -d"/"`
cd "$dir"
abinit < tbase*_x.files > log 2> err
if [ "$(wc -l err)" != "0 err" ]
then
	echo Error: `pastebinit -b pastebin.com err 2> /dev/null`
fi
echo Results: `pastebinit -b pastebin.com tbase*_*.out 2> /dev/null`
cd ..
rm -rf out out.xz
