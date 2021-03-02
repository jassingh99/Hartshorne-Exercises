#!/bin/sh

# $1 is chapter
# $2 is section
# $3 is number of problems (must be between 1 and 99 inclusive)

mkdir "./chapter $1"
mkdir "./chapter $1/section $2"

if [ "$3" -lt "10" ]
then
	for i in $(seq 1 $3); do
		touch "./chapter $1/section $2/problem 0$i.tex" &&
		cp sample.tex "./chapter $1/section $2/problem 0$i.tex" &&
		sed -i "s/C.S.P/$1.$2.$i/" "./chapter $1/section $2/problem 0$i.tex";
	done

else
        for i in $(seq 1 9); do
                touch "./chapter $1/section $2/problem 0$i.tex" &&
                cp sample.tex "./chapter $1/section $2/problem 0$i.tex" &&
                sed -i "s/C.S.P/$1.$2.$i/" "./chapter $1/section $2/problem 0$i.tex";
        done

	for i in $(seq 10 $3); do
		touch "./chapter $1/section $2/problem $i.tex" &&
		cp sample.tex "./chapter $1/section $2/problem $i.tex" &&
		sed -i "s/C.S.P/$1.$2.$i/" "./chapter $1/section $2/problem $i.tex";
	done
fi
