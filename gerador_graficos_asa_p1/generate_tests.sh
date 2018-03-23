#!/bin/bash

# Read type as 1st argument
EXEC=./gerador
FILES=./tests
ARCHES=5

clear
rm -rf tests
mkdir tests


for v in `seq 1000 1000 100000`; do
	#multiplicacao de v por 5
	a=$(expr $v \* $ARCHES)

	#numero aleatorio de scc's, com o range: ()#Vertices / #Edges) < #SCC < #P-1
	scc=$(shuf -i $(expr $v / $a)-$(expr $v - 1) -n 1)

	#ao numero de vertices, somamos o numero de arestas, para dar um numero maior de edges :)
	vert=$(expr $v + $a)

	printf "Generating for $v vertices, $scc SCC's and approximately $vert arches\n"

	$EXEC $v $vert $scc > temp.in

	# naming the file
	# the file will have the name equal to the number you want to test: either $v= number of vertices;
	# $vert = number of vertices+edges (approx) or $scc = number of SCC's specified

	mv temp.in $FILES/$v
done

exit 0
