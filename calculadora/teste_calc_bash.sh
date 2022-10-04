#!/bin/bash
#Autor: Gabriel Montenegro de Campos
#Data: 01/10/2022
#Algoritmo que calcula: soma, subtração, multiplicação e divisão


function menu(){

 clear

 echo "  _____________________________________"
 echo
 echo "               CALCULADORA"
 echo "  _____________________________________"
 echo
 echo
 echo "< 1 > Somar "
 echo "< 2 > Subtração "
 echo "< 3 > Multiplicação "
 echo "< 4 > Divisão "
 echo "< 0 > Sair "
 echo
 echo "Escolha uma das ops acima:  "
 read  op

 case $op in
     1) soma ;;
     2) subtracao ;;
     3) multiplicacao ;;
     4) divisao ;;
     0) exit ;;
 esac

}

function soma(){

    clear
    echo "Digite um número: "
    read num1
    echo "Digite um número: "
    read num2

    soma=$(($num1 + $num2 ))

    echo "Resultado da soma: $soma"

echo
echo "--------------------------------"
echo

    echo "O que deseja fazer agora?"
    echo "< c > Continuar"
    echo "< m >  Menu Principal"
    echo "< s >  Sair"

    echo "Escolha uma op"
    read op

    if [ "$op" = "c" ]
    then
        soma
    elif [ "$op" = "m" ]
    then
        menu
    elif [ "$op" = "s" ]
    then
        clear
        exit
    else
        echo " ERROR! "
    fi
}

function subtracao ()
{

    clear
    echo "Digite um número: "
    read num1
    echo "Digite um número: "
    read num2

    sub=$(($num1 - $num2 ))

    echo "Resultado da sub: $sub"

echo
echo "--------------------------------"
echo

    echo "O que deseja fazer agora?"
    echo "< c > Continuar"
    echo "< m >  Menu Principal"
    echo "< s >  Sair"

    echo "Escolha uma op"
    read op

    if [ "$op" = "c" ]
    then
        subtracao
    elif [ "$op" = "m" ]
    then
        menu
    elif [ "$op" = "s" ]
    then
        clear
        exit
    else
        echo " ERROR! "
    fi

}

function multiplicacao ()
{

    clear
    echo "Digite um número: "
    read num1
    echo "Digite um número: "
    read num2

    mult=$(($num1 * $num2 ))

    echo "Resultado da multiplicacao: $mult"

echo
echo "--------------------------------"
echo

    echo "O que deseja fazer agora?"
    echo "< c > Continuar"
    echo "< m >  Menu Principal"
    echo "< s >  Sair"

    echo "Escolha uma op"
    read op

    if [ "$op" = "c" ]
    then
        multiplicacao
    elif [ "$op" = "m" ]
    then
        menu
    elif [ "$op" = "s" ]
    then
        clear
        exit
    else
        echo " ERROR! "
    fi

}

function divisao ()
{

    clear
    echo "Digite um número: "
    read num1
    echo "Digite um número: "
    read num2

    div=$(($num1 / $num2 ))

    echo "Resultado da divisao: $div"

echo
echo "--------------------------------"
echo

    echo "O que deseja fazer agora?"
    echo "< c > Continuar"
    echo "< m >  Menu Principal"
    echo "< s >  Sair"

    echo "Escolha uma op"
    read op

    if [ "$op" = "c" ]
    then
        divisao
    elif [ "$op" = "m" ]
    then
        menu
    elif [ "$op" = "s" ]
    then
        clear
        exit
    else
        echo " ERROR! "
    fi

}

menu