#!/bin/bash

projeto=NodoWeb
pacoteDoProjeto=nodoWeb

binarios=binarios
construcao=construcao
fontes=fontes
integracao=$binarios/js/nodoWeb.js

binariosJs=$binarios/js
fontesJs=$fontes/js

limpar() {
	echo ":limpar"
	rm -rf $binarios
	rm -rf $construcao
}

criarEstrutura() {
	echo ":criarEstrutura"
	mkdir -p $binarios
	mkdir -p $construcao
	mkdir -p $fontes
	mkdir -p $binariosJs
	mkdir -p $fontesJs
}

adicionarBibliotecas() {
	echo ":adicionarBibliotecas"
}

compilar() {
	limpar
	criarEstrutura
	adicionarBibliotecas
	echo ":compilar"
	cp -rf $fontesJs/* $binariosJs
}

construir() {
	compilar
	echo ":construir"
	cp $binariosJs/$pacoteDoProjeto.js $construcao/$pacoteDoProjeto.js
}

testar() {
	construir
	echo ":testar"
	node $construcao/$pacoteDoProjeto.js
}

depurar() {
	construir
	echo ":depurar"
	node $construcao/$pacoteDoProjeto.js
}

executar() {
	construir
	echo ":executar"
	node $construcao/$pacoteDoProjeto.js
}

integrar() {
	construir
	echo ":integrar"
	node $integracao
}

echo :$pacoteDoProjeto
if [ -n "$1" ]
then
	$1
else
	construir
fi

