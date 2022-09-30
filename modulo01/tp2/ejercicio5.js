//EJERCICIO 5

var texto = "AA"

function isLowerCase(str) { //funcion solo minúsculas
    return str == str.toLowerCase() && str != str.toUpperCase();
}

console.log("sólo minúsculas: " + isLowerCase(texto))

function isUpperCase(str) { //funcion solo mayusculas
    return str == str.toUpperCase();
}

console.log("sólo mayusculas: "+ isUpperCase(texto))

if(isLowerCase(texto) == false && isUpperCase(texto) == false){ //if mayúsculas y minúsculas
    var lowerAndUpper = true
}else{    
    var lowerAndUpper = false
}
console.log('mayusculas y minúsculas: ' + lowerAndUpper)