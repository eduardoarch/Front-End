/**
// getElementById -> Trás UM elemento pelo ID
const input = document.getElementById('main-input')
console.log(input)

// getElementByClassName -> Trás TODOS os elementos com essa classe
const paragrafo = document.getElementsByClassName('paragraph-js')
console.log(paragrafo)

// getElementByTagName -> Trás TODOS os elementos com essa TAG    
const elementP = document.getElementsByTagName('p')
console.log(elementP)

// getElementByName -> Trás TODOS os elementos com esse NAME (Usado normalmente em formulário)
const elementName = document.getElementsByName('nomeCompleto')
console.log(elementName)

// querySelector -> Trás UM elemento, e o PRIMEIRO que encontrar
/* 
    Exemplos:
    const elementSelector = document.querySelector('p')
    const elementSelector = document.querySelector('.paragraph-js')
    const elementSelector = document.querySelector('#main-input') 
*/
/*
const elementSelector = document.querySelector('button.main-input')
console.log(elementSelector)

// querySelectorAll -> Trás TODOS os elementos que encontrar
const elementAll = document.querySelectorAll('.paragraph-js')
console.log(elementAll)
*/

// Alterando textos & HTML no JavaScript
/**
textContent -> Pega todo o conteúdo
innerText -> Pega APENAS o texto 
innerHTML -> Permite adicionar HTML  e texto
 */


const elementeAlterando = document.querySelector('.paragraph-js')

// elementeAlterando.textContent = 'Alterado pelo textContent'
// elementeAlterando.innerText = 'Alterado pelo innerText'
// elementeAlterando.innerHTML = 'Alterado pelo innerHTML'

// console.log(elementeAlterando.textContent)
// console.log(elementeAlterando.innerText)
console.log(elementeAlterando.innerHTML)

