'use strict';
let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));
//console.log(JSON.parse(jsonData));    //comenté porque da error.

/*
¿Qué sucede cuando utilizamos JSON.stringify? Por que?
JSON.stringify() method converts a JavaScript value to a JSON string.

¿Qué sucede cuando utilizamos JSON.parse? Por que?
Nos da error. Porque JSON.parse() no soporta trailing commas in the stringified Object.
*/