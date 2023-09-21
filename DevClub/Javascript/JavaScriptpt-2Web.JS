
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

    Exemplos:
    const elementSelector = document.querySelector('p')
    const elementSelector = document.querySelector('.paragraph-js')
    const elementSelector = document.querySelector('#main-input') 

const elementSelector = document.querySelector('button.main-input')
console.log(elementSelector)

// querySelectorAll -> Trás TODOS os elementos que encontrar
const elementAll = document.querySelectorAll('.paragraph-js')
console.log(elementAll)


// Alterando textos & HTML no JavaScript

textContent -> Pega todo o conteúdo
innerText -> Pega APENAS o texto (leva em conta o CSS)
innerHTML -> Permite adicionar HTML  e texto (suporta adição de tags)
 
const elementeAlterando = document.querySelector('p')

elementeAlterando.textContent = 'Alterado pelo textContent'
elementeAlterando.innerText = 'Alterado pelo innerText'
elementeAlterando.innerHTML = 'Alterado pelo innerHTML'
console.log(elementeAlterando.textContent)
console.log(elementeAlterando.innerText)
console.log(elementeAlterando.innerHTML)


// Alterando CSS(estilos) no JavaScript

const buttonCliqueAqui = document.querySelector('.main-button')
const buttonEnvieSeusDados = document.querySelector('.main-input')
const h1TituloDaPaginaHome = document.querySelector('h1')
const campoDigiteAqui = document.querySelector('#main-input')

campoDigiteAqui.style.fontFamily = 'Fira'
campoDigiteAqui.style.margin = '5px 100px 10px 100px'
h1TituloDaPaginaHome.style.fontSize = '60px'
h1TituloDaPaginaHome.style.fontFamily = ''
buttonEnvieSeusDados.style.color = 'white'
buttonEnvieSeusDados.style.background = 'blue'
buttonEnvieSeusDados.style.fontSize = '16px'
buttonCliqueAqui.style.background = 'purple'
buttonCliqueAqui.style.color = 'white'
buttonCliqueAqui.style.fontSize = '16px'

// Eventos

