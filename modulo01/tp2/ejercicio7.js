//EJERCICIO 7

var cadena = "hola soy una cadena"

function invertirCadena(cad) {
    var separarCadena = cad.split("");  //crea arreglo
    var invertirArreglo = separarCadena.reverse(); // invierte el arreglo
    var unirArreglo = invertirArreglo.join(""); //une todos los elementos cadena

    return unirArreglo; //devuelve cadena invertida
}

console.log(invertirCadena(cadena))
