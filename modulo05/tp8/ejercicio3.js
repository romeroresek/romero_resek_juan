'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
console.log(JSON.stringify(data));
console.log(`sin stringify`);
});

/*
A) ¿Qué sucede cuando utilizamos JSON.stringify?
JSON.parse analiza una cadena de texto como JSON y convertirá a JavaScript object.
JSON.stringify convierte a JavaScript value a JSON string, esta convirtiendo en cadena de texto json. (esto es lo que se muestra por concola)

B) Agregar debajo: console.log(data); ¿Que sucede? Por que?
   va a mostrar solo el primer console.log(), esto sucede porque lee linea una linea a la vez from any readable stream. 
*/
