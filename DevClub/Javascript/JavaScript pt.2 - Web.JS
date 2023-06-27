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
const elementSelector = document.querySelector('button.main-input')
console.log(elementSelector)

