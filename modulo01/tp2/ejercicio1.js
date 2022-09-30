//EJERCICIO 1

var verdadero, char //tuve que declarar las variables porque sino daba error en el array.

var valores = [verdadero, false, 2, "hola", "mundo", 3, char]

//2. elementos de menor a mayor //
var valoresStr = []; //array solo de string
for (let i=0; i < valores.length; i++ ){
    if (typeof valores[i]==="string"){
    valoresStr.push (valores [i])
    }
} 
console.log('2. Imprimir los elementos de menor a mayor cantidad de letras: ' + valoresStr.sort(function(a, b){return a.length - b.length}))


//1. cual de los elementos textos es mayor
function long_string(arr) {
    let longest = arr[0];
    for (let i = 1; i < arr.length; i++) {
        if (arr[i].length > longest.length) {
            longest = arr[i];
        }
    }
    return longest;
}
console.log('1. Determinar cuál de los elementos de texto es mayor: ' + long_string(valoresStr));

//3. Determinar el resultado de las cuatro operaciones matemáticas realizadas con los dos elementos numéricos.
var valoresNum = []; //array solo de números
for (let i=0; i < valores.length; i++ ){
    if (typeof valores[i]==="number"){
    valoresNum.push (parseInt(valores [i]))
    }
}
let suma = valoresNum[0] + valoresNum[1]
let resta = valoresNum[0] - valoresNum[1]
let multiplicacion = valoresNum[0] * valoresNum[1]
let division = valoresNum[0] / valoresNum[1]

console.log(`3. Resultado de las cuatro operaciones matemáticas \n suma: ${suma} \n resta: ${resta}\n multiplicación: ${multiplicacion}\n división: ${division}`)