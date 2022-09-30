//EJERCICIO 6

var texto = prompt("Introduzca una palabra")
var vocales = ["a", "e", "i", "o", "u"];

var textomin = texto.toLowerCase();
var posicion = 0;
var parar = false;
for (var i = 0; i < textomin.length; i++) {
    for (var j = 0; j < vocales.length; j++) {
        if (vocales[j] == textomin.charAt(i)) {
            posicion = i;
            parar = true;
            break;
        }
    }
    if (parar) {
        break;
    }
}
console.log("La primera vocal está en la posición " + posicion)
document.write("La primera vocal está en la posición " + posicion)
