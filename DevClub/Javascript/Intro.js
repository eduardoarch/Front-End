/*
## Logica de programação e algoritimo na PRATICA

Algoritimo para fazer café

SE a cafeteira estiver ligada na tomada, seguir o proximo passo. SE NÃO, ligá-la na tomada.
SE o comportimento de água estiver cheio, seguir para o próximo passo. SE NÃO, enxa-o.
SE o compartimento já estiver uma cápsula, seguir para o próximo passo. SE NÃO, colocar uma cápsula.

Exemplo: SITE DO BANCO CENTRAL DO BRASIL (Conversor de moeda)
Passo um pegar o valor do campo "VALOR".
Passo dois pegar o valor do campo "VALOR" e dividir pelo varial "DÓLAR DOS ESTADOS UNIDOS".
Passo três imprimir o resuldado na tela no campo "RESULTADO DA CONVESÃO".

1.Lógica de programação -> Aprender como o computador pensa e aprender como se comunicar com ele
2.Algoritimo -> Seguência lógica para fazer alguma coisa.
    Ex: Receita de bolo.
3.Como aprender Lógica, como eu fico bom de lógica?
    Pratica, pratica e pratica.

## COMO EXECUTAR JAVASCRIPT ?

Para o computador é necessario instalar o "NODE.JS".
Após a instalação do NODE.JS, podemos ir na linha de comando do terminal e digita o comando >node e a partir desse momento tudo que digitar será javascript.

Hora de coda, abaixo será reservado aos códigos javascript.
Mensagem ""(dentro das aspas será texto) será mostrada no terminal ou console.
console.log("O que eu quiser") 

Mensagem ""(dentro das aspas será texto) será mostrada no web browser
alert("Olá JS")

## O QUE SÃO VARIÁVEIS

Variáveis
- let  --> Pode alterar o valor quando quiser.
- const --> Valor NÃO pode ser declarado NOVAMENTE.
- var --> DESCONTINUADO / NÃO USAR.

Textos 
- string ASPAS DUPLAS, ASPAS SIMPLES OU CRASE --> Textos.
    Não pode repetir nome de variavel.
- ${entra com a variavel}

Sinais de operação
* --> Multiplicação
/ --> Divisão
+ --> Adição
- --> Subtração

OBS: Html, css e javascript ignoram os espaços entre os elementos.

# Tipos de Dados
- String --> Textos
- Numbers --> Números
- Boolean --> Boleano

 */

// Exemplos:
let salaDadiretoria = "Principal"
let refeitorio = "dosAlunos"

console.log(salaDadiretoria)
console.log(refeitorio)

// Strings ASPAS DUPLAS --> (TEXTOS)
const texto1 = "textos com aspas duplas"
const texto2 = 'textos com aspas simples'
const texto3 = `textos com a crase`/**Template literals ou Template String*/

console.log(texto1)
console.log(texto2)
console.log(texto3)

// Template Strings
const myAge = 35
const myCar = 'mercedez'
const mySentimento = 'leve e poderoso'
const myString = `Meu carro é uma ${myCar}, gosto muito de acelerar ela, esqueço de tudo ao meu redor e me sinto ${mySentimento}!`
// const myString = `Minha idade é ${303 - 280}`

console.log(myString)

// Numbers --> (NÚMEROS)

const number1 = 32/2
const fakenumber = "32/2"

console.log(number1)
console.log(fakenumber)

// Boolean --> (BOLEANO)
